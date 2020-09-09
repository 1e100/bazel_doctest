load("@rules_python//python:defs.bzl", "py_binary", "py_library")

package(default_visibility = ["//visibility:public"])

py_library(
    name = "module",
    srcs = ["module.py"],
)

py_test(
    name = "module_test",
    srcs = ["module_test.py"],
    deps = [":module"],
)
