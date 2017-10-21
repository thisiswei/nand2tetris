# predefined symbols

# variables and labels needs to allocate
from .code import a_instr_to_binary

_SYMBOLS = {
    'R0': 0,
    'R1': 1,
    'R2': 2,
    'R3': 3,
    'R4': 4,
    'R5': 5,
    'R6': 6,
    'R7': 7,
    'R8': 8,
    'R9': 9,
    'R10': 10,
    'R11': 11,
    'R12': 12,
    'R13': 13,
    'R14': 14,
    'R15': 15,

    'SP': 0,
    'LCL':1,
    'ARG':2,
    'THIS': 3,
    'THAT': 4,
    'SCREEN': 16384,
    'KBD': 24576,
}


_CURRENT_ADDRESS = {
    'idx': 16
}


# a instruction
# put variables into symbols table


def handle(parsed):
    to_return = []

    _lable_sum = 0
    _ret = []
    for idx, instr in enumerate(parsed):
        if instr['inst'] == 'L':
            _handle_label(idx, instr, _lable_sum)
            _lable_sum +=1
        else:
            _ret.append(instr)


    for instr in _ret:
        if instr['inst'] == 'a':
            to_return.append(_handle_a_instrustion_first_run(instr))
        elif instr['inst'] == 'c':
            to_return.append(_handle_c_instruction(instr))
        # elif instr['inst'] == 'L':
        #     _handle_label(idx, instr)

    ret = []
    for t in to_return:
        if t['inst'] == 'a':
            ret.append(_handle_a_instrustion_sec_run(t))
        else:
            ret.append(t['value'])
    return '\n'.join(ret)



def _handle_a_instrustion_first_run(instr):
    string = instr['str']
    try:
        instr['value'] = int(string)
    except ValueError:
        if string in _SYMBOLS:
            val = _SYMBOLS[string]
            instr['value'] = val
        else:
            # initialize
            _SYMBOLS[string] = None

    return instr


def _handle_a_instrustion_sec_run(instr):
    string = instr['value']
    if isinstance(string, int):
        val = string
    else:
        # allocate memoery, and store the RAM address into symbol table
        # and reutrn the RAM[i]
        string = instr['str']
        if string in _SYMBOLS and _SYMBOLS[string] is not None:
            val = _SYMBOLS[string]
        else:
            _SYMBOLS[string] = _CURRENT_ADDRESS['idx']
            val = _CURRENT_ADDRESS['idx']
            _CURRENT_ADDRESS['idx'] = _CURRENT_ADDRESS['idx'] + 1

    return a_instr_to_binary(val)


def _handle_c_instruction(instr):
    # c_input = {'inst': 'c', 'str': 'D=D+A', 'value': 'D=D+A'}
    string = instr['str']
    m_bit = '1' if '=' in string and 'M' in string.split('=')[1] else '0'

    def _get_jmp_key(string):
        if ';' not in string:
            return 'null'
        return string.split(';')[1]

    jmp_key = _get_jmp_key(string)
    jmp_mapping = {
        # if no ; in the string the jump bit is null
        'null': '000',
        'JGT': '001',
        'JEQ': '010',
        'JGE': '011',
        'JLT': '100',
        'JNE': '101',
        'JLE': '110',
        'JMP': '111',
    }


    def _get_dest_key(string):
        if '=' not in string:
            return 'null'
        return ''.join(sorted(string.split('=')[0]))


    dest_key = _get_dest_key(string)
    dest_mapping = {
        'null': '000',
        'M': '001',
        'D': '010',
        'DM': '011',
        'A': '100',
        'AM': '101',
        'AD': '110',
        'ADM': '111',
    }


    def _get_comp_bits(string):
        # 'D;JMP'
        # 'D=D+M;JMP'
        # 'D=D+M'
        if '=' in string:
            return string.split('=')[1].split(';')[0]

        elif ';' in string:
            return string.split(';')[0]

    comp_key = _get_comp_bits(string)


    comp_mapping = {
        '0': '101010',
        '1': '111111',
        '-1': '111010',
        'D': '001100',
        'A': '110000',
        'M': '110000',
        '!D': '001101',
        '!A': '110001',
        '!M': '110001',
        '-D': '001111',

        '-A': '110011',
        '-M': '110011',

        'D+1': '011111',
        '1+D': '011111',

        'A+1': '110111',
        '1+A': '110111',
        'M+1': '110111',
        '1+M': '110111',


        'D-1': '001110',
        'A-1':'110010',
        'M-1': '110010',

        'D+A': '000010',
        'A+D': '000010',
        'D+M': '000010',
        'M+D': '000010',

        'D-A': '010011',
        'D-M': '010011',

        'A-D': '000111',
        'M-D': '000111',


        'D&A': '000000',
        'A&D': '000000',
        'D&M': '000000',
        'M&D': '000000',

        'D|A': '010101',
        'D|M': '010101',

        'A|D': '010101',
        'M|D': '010101',
        }


    instr['value'] = '111' + m_bit + comp_mapping[comp_key] + dest_mapping[dest_key] + jmp_mapping[jmp_key]
    return instr


def _handle_label(idx, instr, _lable_sum):
    ''' store in symbol table as well'''
    key = instr['value']
    _SYMBOLS[key] = idx - _lable_sum
    return None


def test():
    a_input = {'inst': 'a', 'str': 'R2', 'value': 'R2'}
    ret = _handle_a_instrustion_first_run(a_input)
    assert ret == {'inst': 'a', 'str': 'R2', 'value': 2}

    c_input = {'inst': 'c', 'str': 'D=D+A', 'value': 'D=D+A'}
    c_ret = {'inst': 'c', 'str': 'D=D+A', 'value': '1110000010010000'}
    assert _handle_c_instruction(c_input) == c_ret

    c_input = {'inst': 'c', 'str': 'D|A;JLE', 'value': 'D|A;JLE'}
    c_ret = {'inst': 'c', 'str': 'D|A;JLE', 'value': '1110010101000110'}
    assert _handle_c_instruction(c_input) == c_ret

    c_input = {'inst': 'c', 'str': 'D;JMP', 'value': 'D;JMP'}
    c_ret = {'inst': 'c', 'str': 'D;JMP', 'value': '1110001100000111'}
    assert _handle_c_instruction(c_input) == c_ret




if __name__ == '__main__':
    test()
