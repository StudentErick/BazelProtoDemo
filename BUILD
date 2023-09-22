load("@rules_cc//cc:defs.bzl", "cc_library")

genrule(
  name = "msg_generate_cpp",
  srcs = ["gen_proto.sh"],
  # 这里需要声明所有的输出文件, 目录需要和gen_proto.sh的一致
  outs = [
    "proto_src/DemoMsg.pb.h",
    "proto_src/DemoMsg.pb.cc",
  ],
  cmd = "sh $(location //:gen_proto.sh) $(@D)",  # 注意这里 $(@D)是bazel工作的文件夹
  # 一般只是当前pkg可见
  visibility = ["//visibility:__pkg__"],
)

cc_library(
    name = "bazel_demo_msg",
    srcs = [":msg_generate_cpp"],  # 这里使用上面的输出文件
    deps = [":msg_generate_cpp"],
    linkopts = ["-lprotobuf"],
    copts = ["-O2", "-std=c++17", "-fPIC"],
    visibility = ["//visibility:public"], # 这里需要全局可见
)
