#!/usr/bin/env python3

import os
import sys

DE_S1_TEST = 'de01060201'

LESSON_TESTS_PATH = '/app'

if __name__ == '__main__':
    sys.path.append(LESSON_TESTS_PATH)
    full_lesson_path = os.path.dirname(os.path.abspath(__file__))

    from run_tests import run_tests

    result = run_tests(full_lesson_path, DE_S1_TEST)

    print(result)
