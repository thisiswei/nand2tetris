_mapping = {
    'local': 'LCL',
    'argument': 'ARG',
    'this': 'THIS',
    'that': 'THAT',
    'temp': 'TEMP',
    'pointer': 'POINTER',
    'static': 'STATIC',
}


def parser_helper(string):
    parts = string.split()
    if len(parts) == 1:
        command = parts[0]
        segment = None
        i = None
    else:
        command = parts[0]
        segment = parts[1]
        i = parts[2]

    return {
        'command': command,
        'segment': segment,
        'i': i,
    }


def parser(string):
    parts = parser_helper(string)
    if parts['command'] == 'push':
        return push_helper(parts)

    if parts['command'] == 'pop':
        return pop_helper(parts)

    command = parts['command']
    command_runner = {
        'add': add,
        'sub': sub,

        'eq': eq,
        'lt': lt,
        'gt': gt,

        'neg': neg,
        'not': not_,

        'and': and_,
        'or': or_,
    }.get(command)
    if command_runner:
        return command_runner()


def pop_helper(parts):
    # pop LCL 0
    text = get_text()
    segment = _mapping[parts['segment']]
    i = int(parts['i'])

    if segment == 'POINTER':
        loc = {0: 'THIS', 1: 'THAT'}[i]
        return [
            '@SP',
            'M=M-1',
            'A=M',
            'D=M',
            '@{}'.format(loc),
            'M=D',
        ]

    if segment == 'static':
        return [
            '@SP',
            'M=M-1',
            'A=M'
            'D=M',
            '@StaticTest.{}'.format(i),
            'M=D',
        ]

    if segment == 'TEMP':
        return [
            # get the value v in M-1 and save to @TMP
            '@SP',
            'M=M-1',
            'A=M',
            'D=M',
            '@TMP1{}'.format(text),
            'M=D',

            # D=R5+i
            '@R5',
            'D=A',
            '@{}'.format(i),
            'D=D+A',

            # store the value of pointer to segment+i
            # segmentLocation = R5+i
            '@segmentLocation{}'.format(text),
            'M=D',

            # store TMP value in D
            # D= value of SP-1
            '@TMP1{}'.format(text),
            'D=M',
            # replace LCL + i with TMP
            '@segmentLocation{}'.format(text),
            'A=M',
            'M=D',
        ]
    else:
        return [
            # get the value v in M-1 and save to @TMP
            '@SP',
            'M=M-1',
            'A=M',
            'D=M',
            '@TMP1{}'.format(text),
            'M=D',

            # get the value of: LCL+i
            '@{}'.format(segment.upper()),
            'D=M',
            '@{}'.format(i),
            'D=D+A',
            # store the value of pointer to segment+i
            '@segmentLocation{}'.format(text),
            'M=D',

            # store TMP value in D
            '@TMP1{}'.format(text),
            'D=M',
            # replace LCL + i with TMP
            '@segmentLocation{}'.format(text),
            'A=M',
            'M=D',
        ]

def push_helper(parts):
    if parts['segment'] == 'constant':
        return push_const_helper(parts)
    else:
        return push_other_helper(parts)


def push_other_helper(parts):
    # push local 0
    segment = _mapping[parts['segment']]
    i = int(parts['i'])

    if segment == 'POINTER':
        loc = {0: 'THIS', 1: 'THAT'}[i]
        return [
            '@{}'.format(loc),
            'D=M',
            '@SP',
            'A=M',
            'M=D',
            '@SP',
            'M=M+1',
        ]

    if segment == 'static':
        return [
            '@StaticTest.{}'.format(i),
            'D=M',
            '@SP',
            'A=M',
            'M=D',
            '@SP',
            'M=M+1',
        ]

    if segment == 'TEMP':
        return [
            # D = R5+i
            '@R5',
            'D=A',
            # 'D=M',
            '@{}'.format(i),
            'D=D+A',

            # points to segment+i and store its value in D
            'A=D',
            'D=M',

            # update the value in SP with D
            '@SP',
            'A=M',
            'M=D',

            '@SP',
            'M=M+1',
        ]
    else:
    #     par
        return [
            # gives D the value of: segment + i
            '@{}'.format(segment),
            'D=M',
            # 'D=M',
            '@{}'.format(i),
            'D=D+A',
            # points to segment+i and store its value in D
            'A=D',
            'D=M',
            # update the value in SP with D
            '@SP',
            'A=M',
            'M=D',
            '@SP',
            'M=M+1',
        ]


def push_const_helper(parts):
    return [
        '@' + parts['i'],
        'D=A',
        '@SP',
        'A=M',
        'M=D',
        '@SP',
        'M=M+1',
    ]


# def or_():
#     text = get_text()
#     return [
#         '@SP',
#         'M=M-1',
#         'A=M',
#         'D=M',
#         '@Truefirst{}'.format(text),
#         'D;JNE',

#         # move stack pointer upper
#         '@SP',
#         'M=M-1',
#         'A=M',
#         'D=M',

#         # jmp if not equal
#         '@Truesecond{}'.format(text),
#         'D;JNE',

#         # set to 0
#         '@SP',
#         'A=M',
#         'M=0',
#         '@End{}'.format(text),
#         '0;JMP',

#         '(Truefirst{})'.format(text),
#         ' @SP',
#         ' M=M-1',
#         ' A=M',
#         ' M=1',
#         '@End{}'.format(text),
#         '0;JMP',

#         '(Truesecond{})'.format(text),
#         ' @SP',
#         ' A=M',
#         ' M=1',
#         '@End{}'.format(text),
#         '0;JMP',

#         '(End{})'.format(text),
#         ' @SP',
#         ' M=M+1',
#     ]


def and_():
    return and_or('&')


def or_():
    return and_or('|')


def and_or(cmd):
    # return [
    #     '@SP',
    #     'M=M-1',
    #     'A=M',
    #     'D=M',
    #     '@False{}'.format(text),
    #     'D;JEQ',

    #     '@SP',
    #     'M=M-1',
    #     'A=M',
    #     'D=M',

    #     '@Last{}'.format(text),
    #     'D;JEQ',

    #     '@SP',
    #     'A=M',
    #     'M=1',
    #     '@END{}'.format(text),
    #     '0;JMP',

    #     '(False{})'.format(text),
    #     ' @SP',
    #     ' M=M-1',
    #     ' A=M',
    #     ' M=0',
    #     '@END{}'.format(text),
    #     '0;JMP',

    #     '(Last{})'.format(text),
    #     ' @SP',
    #     ' A=M',
    #     ' M=0',
    #     '@END{}'.format(text),
    #     '0;JMP',

    #     '(END{})'.format(text),
    #     ' @SP',
    #     ' M=M+1',
    # ]

    return [
        '@SP',
        'M=M-1',
        'A=M',
        'D=M',
        '@SP',
        'M=M-1',
        'A=M',
        'M=D{}M'.format(cmd),
        '@SP',
        'M=M+1',
    ]

    # return [
    #     '@SP',
    #     'M=M-1',
    #     'A=M',
    #     'D=M',
    #     'A=A-1',
    #     'D=D{}M'.format(cmd),
    #     '@SP',
    #     'A=M-1',
    #     'M=D',
    # ]

    # return [
    #     '@SP',
    #     'M=M-1',
    #     'A=M',
    #     'D=M',
    #     '@SP',
    #     'M=M-1',
    #     'A=M',
    #     'D=D {} M'.format(cmd),
    #     '@SP',
    #     'M=M+1',
    #     'A=M',
    #     'M=D',
    #     '@SP',
    #     'M=M+1',
    # ]


def neg():
    return [
        # TODO!
        '@SP',
        'M=M-1',
        'A=M',
        # 'M=!M',
        'M=-M',
        # neg is negative
        # M + !M + 1 = 0
        # M + !M = -1
        # M = -(1 + !M)
        # 'M=M-1',
        '@SP',
        'M=M+1',
    ]

import uuid

def get_text():
    return str(uuid.uuid4())[:8]

def not_():
    text = get_text()
    return [
        '@SP',
        'M=M-1',
        'A=M',
        'D=M',
        '@False{}'.format(text),
        'D ; JEQ',
        '@SP',
        'A=M',
        'M=0',
        '@END{}'.format(text),
        '0 ; JEQ',
        '(False{})'.format(text),
        ' @SP',
        ' A=M',
        ' M=1',
        '(END{})'.format(text),
        ' @SP',
        ' M=M+1',
    ]


def lt():
    return cmp_base('LT')


def gt():
    return cmp_base('GT')


def eq():
    return cmp_base('EQ')


def cmp_base(cmd):

    text = get_text()
    return [
        '@SP',
        'M=M-1',
        'A=M',
        'D=M',
        '@SP',
        'M=M-1',
        'A=M',
        'D=M-D',
        '@True{}'.format(text),
        'D ; J{}'.format(cmd),
        '@SP',
        'A=M',
        'M=0',
        '@END{}'.format(text),
        '0 ; JMP',
        '(True{})'.format(text),
        ' @SP',
        ' A=M',
        ' M=1',
        '(END{})'.format(text),
        ' @SP',
        ' M=M+1',
    ]


# def cmp_base(cmd):

#     text = get_text()
#     return [
#         '@SP',
#         'M=M-1',
#         'A=M',
#         'D=M',
#         '@SP',
#         'M=M-1',
#         'A=M',
#         '@HEY{}'.format(text),
#         'D=D-M',
#         'D ; J{}'.format(cmd),
#         '@0',
#         'D=A',
#         '@END{}'.format(text),
#         '0 ; JMP',
#         '(HEY{})'.format(text),
#         '  @1',
#         '  D=A',
#         '(END{})'.format(text),
#         '  @SP',
#         '  A=M',
#         '  M=D',
#         '  @SP',
#         '  M=M+1',
#     ]


# def eq():
#     return [
#         '@SP',
#         'M=M-1',
#         'A=M',
#         'D=M',
#         '@SP',
#         'M=M-1',
#         'A=M',
#         'M=M+D',
#         '@SP',
#         'M=M+1',
#     ]

# def add():
#     return [
#         '@SP',
#         'M=M-1',
#         'A=M',
#         'D=M',
#         '@SP',
#         'M=M-1',
#         'A=M',
#         'M=D+M',
#         '@SP',
#         'M=M+1',
#     ]


# def sub():
#     return [
#         '@SP',
#         'M=M-1',
#         'A=M',
#         'D=M',
#         '@SP',
#         'M=M-1',
#         'A=M',
#         'M=D-M',
#         '@SP',
#         'M=M+1',
#     ]

def add():
    return add_sub('+')


def sub():
    return add_sub('-')


def add_sub(cmd):
    return [
        '@SP',
        'M=M-1',
        'A=M',
        'D=M',
        '@SP',
        'M=M-1',
        'A=M',
        'M=M{}D'.format(cmd),
        '@SP',
        'M=M+1',
    ]


xs = [
    'push constant 7',
    'push constant 8',
    'add',
]

xs = [
    'push constant 17',
    'push constant 17',
    'eq',
    'push constant 17',
    'push constant 16',
    'eq',
    'push constant 16',
    'push constant 17',
    'eq',
    'push constant 892',
    'push constant 891',
    'lt',
    'push constant 891',
    'push constant 892',
    'lt',
    'push constant 891',
    'push constant 891',
    'lt',
    'push constant 32767',
    'push constant 32766',
    'gt',
    'push constant 32766',
    'push constant 32767',
    'gt',
    'push constant 32766',
    'push constant 32766',
    'gt',
    'push constant 57',
    'push constant 31',
    'push constant 53',
    'add',
    'push constant 112',
    'sub',
    'neg',
    'and',
    'push constant 82',
    'or',
    'not',
]

# basicTest.vm
xs = [
    'push constant 10',
    'pop local 0',
    'push constant 21',
    'push constant 22',
    'pop argument 2',
    'pop argument 1',
    'push constant 36',
    'pop this 6',
    'push constant 42',
    'push constant 45',
    'pop that 5',
    'pop that 2',
    'push constant 510',
    'pop temp 6',
    'push local 0',
    'push that 5',
    'add',
    'push argument 1',
    'sub',
    'push this 6',
    'push this 6',
    'add',
    'sub',
    'push temp 6',
    'add',
]


# PointerTest.vm
xs = [
    'push constant 3030',
    'pop pointer 0',
    'push constant 3040',
    'pop pointer 1',
    'push constant 32',
    'pop this 2',
    'push constant 46',
    'pop that 6',
    'push pointer 0',
    'push pointer 1',
    'add',
    'push this 2',
    'sub',
    'push that 6',
    'add',
]


# StaticTest.vm
xs = [
    'push constant 111',
    'push constant 333',
    'push constant 888',
    'pop static 8',
    'pop static 3',
    'pop static 1',
    'push static 3',
    'push static 1',
    'sub',
    'push static 8',
    'add',
]

for x in xs:
    ret = parser(x)
    print '// ' + x
    print '\n'.join(ret)
