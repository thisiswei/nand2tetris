from .main import parse
from .symbol_table import handle
from .symbol_table import _SYMBOLS



def main():
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('--filename')
    parser.add_argument('--dest')
    args = parser.parse_args()

    parsed = parse(args.filename)

    print handle(parsed)

    open(args.dest, 'w+').write(handle(parsed))


if __name__ == '__main__':
    main()
