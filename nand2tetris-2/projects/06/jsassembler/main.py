import re



def parse(filename):
    # give me a file name, parse all the lines
    # and ignore the whitespace and comments

    content = open(filename).read()
    return _parse_content(content)




def _parse_content(content):
    content = re.sub(r'//.*', '', content)
    lines = filter(None, [re.sub(r'\s*', '', l) for l in content.splitlines()])
    to_return = []
    for l in lines:
        if '@' in l:
            to_return.append({
                'inst': 'a',
                'str': l.split('@')[1],
                'value': l.split('@')[1],
            })
        elif l.startswith(('(',)):
            # (LABEL)
            to_return.append({
                'inst':'L',
                'str': l,
                'value': l.replace('(', '').replace(')', ''),
            })

        else:
            to_return.append({
                'inst': 'c',
                'str': l,
                'value': l,
            })
    return to_return


def test():
    content = '''
    @2   // comment
    D=A     // sllsdlfsld
    @3      // sdfsdkfljsdlkfjsdk
    D=D+A
    @0
    M=D
    '''

    equals_to = [
        {'inst': 'a', 'str': '2', 'value': '2'},
        # ('a', '2'),

        {'inst': 'c', 'str': 'D=A', 'value': 'D=A'},
        # ('c', 'D=A'),

        {'inst': 'a', 'str': '3', 'value': '3'},
        # ('a', '3'),

        {'inst': 'c', 'str': 'D=D+A', 'value': 'D=D+A'},
        # ('c', 'D=D+A'),

        {'inst': 'a', 'str': '0', 'value': '0'},
        # ('a', '0'),

        {'inst': 'c', 'str': 'M=D', 'value': 'M=D'},
        # ('c', 'M=D'),

        # L commands?
    ]

    assert _parse_content(content) == equals_to

    content = '''
    @2   // comment
    D=A     // sllsdlfsld
    @3      // sdfsdkfljsdlkfjsdk
    D=D+A
    (LABEL)
    @0
    M=D
    '''
    equals_to = [
        {'inst': 'a', 'str': '2', 'value': '2'},
        # ('a', '2'),

        {'inst': 'c', 'str': 'D=A', 'value': 'D=A'},
        # ('c', 'D=A'),

        {'inst': 'a', 'str': '3', 'value': '3'},
        # ('a', '3'),

        {'inst': 'c', 'str': 'D=D+A', 'value': 'D=D+A'},
        # ('c', 'D=D+A'),

        # TODO label
        {'inst': 'L', 'str': '(LABEL)', 'value': 'LABEL'},

        {'inst': 'a', 'str': '0', 'value': '0'},
        # ('a', '0'),

        {'inst': 'c', 'str': 'M=D', 'value': 'M=D'},
        # ('c', 'M=D'),
    ]
    assert _parse_content(content) == equals_to



def main():
    # import argparse
    # parser = argparse.ArgumentParser()
    # parser.add_argument('--filename')
    # args = parser.parse_args()

    # print parse(args.filename)
    test()

if __name__ == '__main__':
    exit(main())
