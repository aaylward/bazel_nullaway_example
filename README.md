# Bazel NullAway Example

[![CI](https://github.com/aaylward/bazel_nullaway_example/actions/workflows/ci.yml/badge.svg)](https://github.com/aaylward/bazel_nullaway_example/actions/workflows/ci.yml)

This project demonstrates how to integrate [NullAway](https://github.com/uber/NullAway) into a [Bazel](https://bazel.build/) Java project using [Error Prone](https://errorprone.info/).

## Overview

NullAway is a tool to help eliminate `NullPointerException`s (NPEs) in your Java code with low build-time overhead. This example shows a pattern for automatically applying NullAway to all Java targets in your project using custom Bazel rule wrappers.

## Project Structure

- `bazel/rules/java.bzl`: Contains custom wrappers for `java_library`, `java_binary`, and `java_test`. These wrappers automatically add the NullAway Java plugin and the necessary `javacopts` to enable null checking.
- `bazel/rules/BUILD.bazel`: Defines the `java_plugin` for NullAway and Error Prone.
- `src/main/java/com/example/`: A sample Java application using [JSpecify](https://jspecify.dev/) annotations (`@Nullable`).

## Usage

### Prerequisites

- [Bazelisk](https://github.com/bazelbuild/bazelisk) (to manage the Bazel version specified in `.bazelversion`)
- Java JDK 25

### Build

To build the project:

```bash
bazel build //...
```

### Test

To run the tests:

```bash
bazel test //...
```

### Demonstrating NullAway

To see NullAway in action, try modifying `src/main/java/com/example/Hello.java` to dereference a nullable string without a null check:

```java
public static void main(String[] args) {
    String s = getNullableString();
    // This should trigger a NullAway error
    System.out.println(s.length()); 
}
```

When you run `bazel build //...`, the build should fail with an error from NullAway.

## Configuration

NullAway is configured in `bazel/rules/java.bzl` with the following options:

- `-Xep:NullAway:ERROR`: Treats NullAway warnings as errors.
- `-XepOpt:NullAway:AnnotatedPackages=com.example`: Specifies which packages NullAway should analyze.
- `-XDcompilePolicy=simple`: Required for Error Prone plugins.

## License

This project is released under the Unlicense. See [LICENSE](LICENSE) for details.
