#!/usr/bin/env python3
""" This demonstrates how to do doctests without the custom rule. """

import doctest
import unittest


def load_tests(loader, tests, ignore):
    tests.addTests(doctest.DocTestSuite("module"))
    return tests


if __name__ == "__main__":
    unittest.main()
