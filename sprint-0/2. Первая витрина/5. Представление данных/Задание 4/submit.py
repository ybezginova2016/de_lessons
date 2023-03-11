#!/usr/bin/env python3

import os
import sys

LESSON_TESTS_PATH = '/app/sprint-0-tests/2_lesson5'

if __name__ == '__main__':
    sys.path.append(LESSON_TESTS_PATH)
    full_lesson_path = os.path.dirname(os.path.abspath(__file__))

    from de_tests_4 import run_tests

    result = run_tests(full_lesson_path, 4)

    print(result)
