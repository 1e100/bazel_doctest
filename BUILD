load("@rules_python//python:defs.bzl", "py_library", "py_test")
load("//:doctest.bzl", "py_doc_test")

package(default_visibility = ["//visibility:public"])

py_library(
    name = "module",
    srcs = ["module.py"],
)

py_library(
    name = "another_module",
    srcs = ["another_module.py"],
)

# This is how you'd normally declare a doctest if you didn't have
# `py_doc_test` macro.
py_test(
    name = "module_test",
    srcs = ["module_test.py"],
    deps = [":module"],
)

py_doc_test(
    name = "module_doctest",
    srcs = [
        ":another_module",
        ":module",
        # This is allowed, but strongly discouraged. You should
        # only declare doctests within the same module.
        "//package/subpackage",
    ],
)
