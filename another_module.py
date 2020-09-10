""" This is a test module. """


def a_times_b(a: int, b: int) -> int:
    """ Adds `a` and `b`.

    >>> a_times_b(0, 3)
    0
    >>> a_times_b(-3, 3)
    -9
    >>> a_times_b(2, 2)
    4
    """
    return a * b

