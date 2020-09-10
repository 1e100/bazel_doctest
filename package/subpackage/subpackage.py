""" This is a test module that uses a package-level target. """


def a_minus_b(a: int, b: int) -> int:
    """ Adds `a` and `b`.

    >>> a_minus_b(0, 3)
    -3
    >>> a_minus_b(-3, 3)
    -6
    >>> a_minus_b(2, 2)
    0
    """
    return a - b

