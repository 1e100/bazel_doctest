""" Implements Python doctest support for Bazel. """

load("@rules_python//python:defs.bzl", "PyInfo", "py_test")

def _target_to_module(target):
    """ Converts the label name to the Python module name. """
    label = target.label
    return ".".join([label.package.replace("/", "."), label.name])

def _py_doctest_runner_impl(ctx):
    """ Generates Python test file that pulls in doctests (if any) for all Python
    libraries in deps, and then provides that file to py_test target. """
    module_includes = []
    if len(ctx.attr.deps) == 0:
        fail("Attribute `deps` must contain one or more dependencies.")
    for d in ctx.attr.deps:
        include = "  tests.addTests(doctest.DocTestSuite('{}'))".format(_target_to_module(d))
        module_includes.append(include)
    module_lines = "\n".join(module_includes)
    doctest_tpl = r"""#!/usr/bin/env python3
import doctest
import unittest


def load_tests(loader, tests, ignore):
{}
  return tests


if __name__ == "__main__":
  unittest.main()"""
    doctest_src = doctest_tpl.format(module_lines)
    runner = ctx.actions.declare_file(ctx.attr.name)
    ctx.actions.write(
        runner,
        content = doctest_src,
        is_executable = True,
    )
    return [
        DefaultInfo(files = depset([runner])),
    ]

_doctest_script = rule(
    implementation = _py_doctest_runner_impl,
    attrs = {
        "deps": attr.label_list(
            mandatory = True,
            allow_empty = False,
            providers = [PyInfo],
            doc = "List of Python targets potentially containing doctests.",
        ),
    },
)

# Deliberately using the required _test convention so that this is easy to
# search for.
def py_doc_test(name, deps, args = None, **kwargs):
    runner_target = "%s-doctest-runner.py" % name

    # Generate the script which runs doctests.
    _doctest_script(
        name = runner_target,
        deps = deps,
        testonly = True,
        args = args,
    )

    # Run the doctests.
    py_test(
        name = name,
        srcs = [runner_target],
        deps = deps,
        main = runner_target,
        legacy_create_init = False,
        imports = ["."],
        python_version = "PY3",
        **kwargs
    )
