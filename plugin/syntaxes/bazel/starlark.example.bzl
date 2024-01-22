# Declare a variable
name = "example"

# Define a rule
cc_binary(
    name = name,
    srcs = ["main.cc"],
    deps = [
        "//path/to:library",
        "@external_repo//:external_library",
    ],
)

# Define a genrule
genrule(
    name = "gen",
    srcs = ["input.txt"],
    outs = ["output.txt"],
    cmd = "echo $(cat $<) > $@",
)

# Define a go_library
go_library(
    name = "go_lib",
    srcs = glob(["**/*.go"]),
    deps = [
        "//path/to:go_library",
    ],
)

# Define a test rule
cc_test(
    name = "test",
    srcs = ["test.cc"],
    deps = [":example"],
)
