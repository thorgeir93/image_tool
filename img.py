""" Wrapper around image tools from https://github.com/thorgeir93/image_tool
"""
import os
import sys
import argparse
import subprocess


__author__ = "thorgeir <thorgeirsigurd@gmail.com>"


def parse_arguments():
    parser = argparse.ArgumentParser(
        description='Simple wrapper around my personal image tools.'
    )

    parser.add_argument('-w', '--target-dir',
        help=(
            'An absolute path to a directory to work in, '
            'usually where the photos are located.'
        )
    )

    subparsers = parser.add_subparsers(
        help=(
            'sub-commands, run one of the sub-commands '
            'with -h flag to get more help.'
        )
    )

    parser_view = subparsers.add_parser('view') 
    parser_view.add_argument('-s', '--script', default='view_image.sh')

    parser_view = subparsers.add_parser('import') 
    parser_view.add_argument('-s', '--script', default='import_image.sh')

    args = parser.parse_args()

    return args


def bash(scriptpath, target_dir):
    """ Run bash command. """
    command = [scriptpath, target_dir]
    print('+ {0}'.format(' '.join(command)))

    process = subprocess.Popen(
        command,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )

    output, error = process.communicate()


def main(args):
    """ Run an image tool with given args. """
    current_dir = os.path.dirname(os.path.abspath(__file__))
    scriptpath = os.path.join(current_dir, args.script)
    bash(scriptpath, args.target_dir)


if __name__ == '__main__':
    args = parse_arguments()
    main(args)
