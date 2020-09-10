# Bazel Doctest

Much to my surprise, I could not find support for the excellent `doctest`
Python tests in Bazel, so I implemented a macro, which I am sharing here.

## Usage

In your `BUILD` file:

```starlark
load("//:doctest.bzl", "py_doc_test")

py_doc_test(
  name = "foo_doctest",
  deps = [":bar", ":baz"]
)
```

If python targets `:bar` and `:baz` define doctests, these doctests will be
executed. If your tests are not instantaneous or if dependencies have large
transitive closures, you might want to use the preferred "one test per library"
pairing so that your build could remain fast and incremental.

See `BUILD` files in this repo for details.

## Contributions

PRs welcome.

## License

MIT
