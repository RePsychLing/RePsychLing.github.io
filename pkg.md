---
title: "Pkg.jl: Julia package management for fun and profit"
author: Dave Kleinschmidt <dave.f.kleinschmidt@gmail.com>
---

# Basics

What happens when you type `using MixedModels`?  How does Julia know what bit of
code to run?  Where does it look to find this code?  Which version is it using?
The answers to these questions are the province of the "package manager",
Pkg.jl.  As always, the [official
documentation](https://docs.julialang.org/en/v1/stdlib/Pkg/index.html) is the
best source of infromation.  But in the interest of expediency, here is a cheat
sheet.

## Projects in Julia

A project in Julia is like a packrat project (R) or virtualenv (python).

It is a list of the packages that are used for running some bit of julia code.

Any directory can be a project, as long as it has a
[Project.toml](#Project.toml) file in it.

## Project.toml

Lists the **dependencies** for a project.

A basic Project.toml has one section, that lists the dependencies like this:

```
[deps]
BenchmarkTools = "6e4b80f9-dd63-53aa-95a3-0cdb28fa8baf"
CSV = "336ed68f-0bac-5ca0-87d4-7b16caf5d00b"
DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
GLM = "38e38edf-8417-5370-95a0-9cbb8c7f171a"
```

This is how Julia knows what you mean when you say `using CSV`.  `CSV` is just a
convenient, human-readable shorthand for the "real" name of the package, which
is the UUID (Universally Unique ID), `336ed68f-0bac-5ca0-87d4-7b16caf5d00b`.

You **rarely if ever need to edit `Project.toml` by hand**.  It is automatically
generated by the package manager the vast majority of the time, using commands
in **Pkg mode**.

## Pkg mode

To enter package mode, press `]`. The `julia>` prompt should change to a pkg
prompt, like `(v1.3) pkg>`.

The bit in the parentheses gives the name of the current project environment.

The **default environment** is the global environment for the current Julia version
(in this case, 1.3).

### Creating and activating a project environment

But any directory can be a project.  To **activate** a project in a directory,
you do:

```julia-repl
julia> # press ] to enter Pkg mode...

(v1.3) pkg> activate path/to/your/project/directory
Activating new environment at `~/path/to/your/project/directory/Project.toml`

(directory) pkg>
```

Noticed that the Pkg mode prompt now shows that you're in the new project (it's
named after the directory.  Now, whenever you do an Pkg operations, they apply
to this project.

### Adding required packages to your project

You need to `add` every package that you directly import with `using` or
`import` in your scripts/jmd files:

```julia-repl
(directory) pkg> add StatsBase
 Resolving package versions...
  Updating `~/path/to/your/project/directory/Project.toml`
  [2913bbd2] + StatsBase v0.32.1
  Updating `~/path/to/your/project/directory/Manifest.toml`
  [9a962f9c] + DataAPI v1.1.0
  [864edb3b] + DataStructures v0.17.9
  [e1d29d7a] + Missings v0.4.3
  [bac558e1] + OrderedCollections v1.1.0
  [a2af1166] + SortingAlgorithms v0.3.1
  [2913bbd2] + StatsBase v0.32.1
  [2a0f44e3] + Base64
  [8ba89e20] + Distributed
  [b77e0a4c] + InteractiveUtils
  [8f399da3] + Libdl
  [37e2e46d] + LinearAlgebra
  [56ddb016] + Logging
  [d6f4376e] + Markdown
  [de0858da] + Printf
  [9a3f8284] + Random
  [9e88b42a] + Serialization
  [6462fe0b] + Sockets
  [2f01184e] + SparseArrays
  [10745b16] + Statistics
  [8dfed614] + Test
  [4ec0a83e] + Unicode
```

Two things have happened: first, the new Project.toml lists `StatsBase` as a
dependency:

```
[deps]
StatsBase = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
```

Second, a **Manifest.toml** file has been created, which lists the exact
versions of all packages that have been installed to satisfy the requirements of
this project.

```
# This file is machine-generated - editing it directly is not advised

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[DataAPI]]
git-tree-sha1 = "674b67f344687a88310213ddfa8a2b3c76cc4252"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.1.0"

[[DataStructures]]
deps = ["InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "b7720de347734f4716d1815b00ce5664ed6bbfd4"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.17.9"

(many more entries)...
```

Because each project has its own, independent manifest, **each project can have
its own version of the packages it needs**.  This is really useful for
stability, and for reproducibility.

### `instantiate` to reproduce

If you have downloaded a directory with a Project.toml created by someone else
(including "past you" or "other computer you"), you can **instantiate** that
environment via:

```julia-repl
julia> # press ] to enter Pkg mode...

(v1.3) pkg> activate path/to/your/project/directory/
Activating environment at `~/path/to/your/project/directory/Project.toml`

(directory) pkg> instantiate
  Updating registry at `~/.julia/registries/General`
  Updating git-repo `git@github.com:JuliaRegistries/General.git`
 Resolving package versions...
  Updating `~/code/RePsychLing/path/to/your/project/directory/Project.toml`
  [2913bbd2] + StatsBase v0.32.1
  Updating `~/code/RePsychLing/path/to/your/project/directory/Manifest.toml`
  [9a962f9c] + DataAPI v1.1.0
  [864edb3b] + DataStructures v0.17.9
  [e1d29d7a] + Missings v0.4.3
  [bac558e1] + OrderedCollections v1.1.0
  [a2af1166] + SortingAlgorithms v0.3.1
  [2913bbd2] + StatsBase v0.32.1
  [2a0f44e3] + Base64
  [8ba89e20] + Distributed
  [b77e0a4c] + InteractiveUtils
  [8f399da3] + Libdl
  [37e2e46d] + LinearAlgebra
  [56ddb016] + Logging
  [d6f4376e] + Markdown
  [de0858da] + Printf
  [9a3f8284] + Random
  [9e88b42a] + Serialization
  [6462fe0b] + Sockets
  [2f01184e] + SparseArrays
  [10745b16] + Statistics
  [8dfed614] + Test
  [4ec0a83e] + Unicode
```

This effectively `add`s every package in the Project.toml.  (It also does some
fancy version resolution to find a set of versions that are all mutually
compatible).

If you also have a Manifest.toml for this project, then `instantiate` will
install the **exact versions** of all the packages listed in the Manfiest.  This
means that you have a perfectly portable version of your project.

### Other Pkg operations

* `rm` to remove packages
* `up` to update all packges to latest versions
* `up PkgName` to update `PkgName` to the latest (compatible) version.
* `resolve` to try to find a set of compatible versions

### adding specific versions of packages

* `add PkgName@a.b.c` add version `a.b.c` of package (or a compatible version).
* `add PkgName#master` add the master branch (usually pre-release) version of a
  package.
* `add https://www.github.com/user/somepackage.jl` add an un-released package
  from a git URL.

NOTE: version information is automatically recorded in Manifest.toml, but
**not** in Project.toml.

### compatibility in Project.toml

You can add compatibility restrictions in Project.toml
but this is generally not necessary for one-off projects (like analysis scripts
etc.) which are not intended to wide re-use (unlike a "real" package):

```
[deps]
StatsBase = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"

[compat]
StatsBase = "0.32"
```

The rules of which exact versions are compatible are somewhat complex, and are
documented here.  The resolver obeys "semantic versioning" or "semver", if that
means anything to you, with the added rule that pre-1.0, a minor version counts
as a breaking ("major") release, so by this rule 1.0, 0.32, 0.31 are all
considered **incompatible**.