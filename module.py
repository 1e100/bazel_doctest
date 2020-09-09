""" This is a test module. """


def a_plus_b(a: int, b: int) -> int:
    """ Adds `a` and `b`.

    >>> a_plus_b(0, 3)
    3
    >>> a_plus_b(-3, 3)
    0
    >>> a_plus_b(2, 2)
    4
    """
    return a + b
