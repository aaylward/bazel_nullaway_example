"""Java rules wrapper with NullAway enabled."""

load("@rules_java//java:defs.bzl", _java_binary = "java_binary", _java_library = "java_library", _java_test = "java_test")
load("@rules_jvm_external//:defs.bzl", _artifact = "artifact")

artifact = _artifact

_NULLAWAY_PLUGIN = "//bazel/rules:nullaway"

_JAVACOPTS = [
    "-XDcompilePolicy=simple",
    "-Xep:NullAway:ERROR",
    "-XepOpt:NullAway:AnnotatedPackages=com.example",
]

def java_library(
        name,
        srcs = None,
        deps = None,
        plugins = None,
        javacopts = None,
        **kwargs):
    """Wrapper for java_library with NullAway."""
    plugins = list(plugins or [])
    javacopts = list(javacopts or [])
    deps = list(deps or [])

    if srcs:
        if _NULLAWAY_PLUGIN not in plugins:
            plugins.append(_NULLAWAY_PLUGIN)

        for opt in _JAVACOPTS:
            if opt not in javacopts:
                javacopts.append(opt)

    _java_library(
        name = name,
        srcs = srcs,
        deps = deps if deps else None,
        plugins = plugins if plugins else None,
        javacopts = javacopts if javacopts else None,
        **kwargs
    )

def java_binary(
        name,
        srcs = None,
        deps = None,
        plugins = None,
        javacopts = None,
        **kwargs):
    """Wrapper for java_binary with NullAway."""
    plugins = list(plugins or [])
    javacopts = list(javacopts or [])
    deps = list(deps or [])

    if srcs:
        if _NULLAWAY_PLUGIN not in plugins:
            plugins.append(_NULLAWAY_PLUGIN)

        for opt in _JAVACOPTS:
            if opt not in javacopts:
                javacopts.append(opt)

    _java_binary(
        name = name,
        srcs = srcs,
        deps = deps if deps else None,
        plugins = plugins if plugins else None,
        javacopts = javacopts if javacopts else None,
        **kwargs
    )

def java_test(
        name,
        srcs = None,
        deps = None,
        plugins = None,
        javacopts = None,
        **kwargs):
    """Wrapper for java_test with NullAway."""
    plugins = list(plugins or [])
    javacopts = list(javacopts or [])
    deps = list(deps or [])

    if srcs:
        if _NULLAWAY_PLUGIN not in plugins:
            plugins.append(_NULLAWAY_PLUGIN)

        for opt in _JAVACOPTS:
            if opt not in javacopts:
                javacopts.append(opt)

    _java_test(
        name = name,
        srcs = srcs,
        deps = deps if deps else None,
        plugins = plugins if plugins else None,
        javacopts = javacopts if javacopts else None,
        **kwargs
    )
