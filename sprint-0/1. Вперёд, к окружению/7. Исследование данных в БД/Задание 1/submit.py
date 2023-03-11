#!/usr/bin/env python3

import os
import sys

LESSON_TESTS_PATH = '/app/sprint-0-tests/1_lesson7'

if __name__ == '__main__':
    sys.path.append(LESSON_TESTS_PATH)
    full_lesson_path = os.path.dirname(os.path.abspath(__file__))

    from de_tests_1 import run_tests

    result = run_tests(full_lesson_path, 1)

    print(result)
