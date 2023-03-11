#!/usr/bin/env python3

import os
import sys

LESSON_TESTS_PATH = '/app/sprint-0-tests/de_tests'

if __name__ == '__main__':
    full_lesson_path = os.path.dirname(os.path.abspath(__file__))

    sys.path.append(LESSON_TESTS_PATH)
    from de_tests import DETests

    test = DETests(full_lesson_path, 'S0P3L8T1')

    print(test.test()[1])
