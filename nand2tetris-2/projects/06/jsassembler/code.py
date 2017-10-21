


def a_instr_to_binary(digits):
    digits = int(digits)
    _translated = '0000000000000000' + ''.join(map(str, _to_bits(digits)))
    return '0' + _translated[-15:]


def _to_bits(num):
    def _helper(n, acc):
        if n == 0:
            return acc
        return _helper(n/2, [n % 2] + acc)

    return _helper(num, [])



def test():
    assert a_instr_to_binary('@10') == '0000000000001010'
    assert a_instr_to_binary('@256') == '0000000100000000'
    assert a_instr_to_binary('@1024') == '0000010000000000'



if __name__ == '__main__':
    test()
