def setup_workspace():
  # GRPC
  native.bind(
      name = "grpc_cpp_plugin",
      actual = "//third_party/grpc:grpc_cpp_plugin")

  native.bind(
      name = "grpc_lib",
      actual = "//third_party/grpc:grpc++_unsecure")

  # Protocol Buffer
  native.git_repository(name="protobuf",
      tag="v3.2.0",
      remote="https://github.com/google/protobuf.git")

  native.bind(
      name = "protobuf_clib",
      actual = "@protobuf//:protoc_lib",
  )

  # Python SIX
  native.new_http_archive(
      name = "six_archive",
      url = "http://pypi.python.org/packages/source/s/six/six-1.10.0.tar.gz",
      sha256 = "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a",
      strip_prefix = "six-1.10.0",
      build_file = str(Label("//third_party/external:six.BUILD")),
  )

  native.bind(
      name = "six",
      actual = "@six_archive//:six",
  )

  # zlib
  native.new_http_archive(
      name = "zlib_archive",
      url = "http://zlib.net/fossils/zlib-1.2.8.tar.gz",
      sha256 = "36658cb768a54c1d4dec43c3116c27ed893e88b02ecfcb44f2166f9c0b7f2a0d",
      strip_prefix = "zlib-1.2.8",
      build_file = str(Label("//third_party/external:zlib.BUILD")),
  )

  native.bind(
      name = "zlib",
      actual = "@zlib_archive//:zlib",
  )

  # boringssl
  native.git_repository(
      name = "boringssl",
      commit="7cfb037",
      remote="https://github.com/google/boringssl.git"
  )

  native.bind(
      name = "libssl",
      actual = "@boringssl//:ssl")
