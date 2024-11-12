load("@rules_python//python:defs.bzl", "py_library")
load("//:doctest.bzl", "py_doc_test")

package(default_visibility = ["//visibility:public"])

py_library(
    name = "subpackage",
    srcs = ["subpackage.py"],
)

py_doc_test(
    name = "subpackage_doctest",
    srcs = [":subpackage"]
)
