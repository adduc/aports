# Additional Packages for Alpine Linux

This repository contains APKBUILD files for various additional packages that are not included in the official Alpine Linux repositories. These packages are designed to be used with Alpine Linux and can be built using the `abuild` tool.

## Usage

A makefile and docker compose configuration are included to simplify the build process. To get started, run the following command:

```bash
make start
```

This will start the build environment. If this is your first time running the build environment, you will need to generate a key to sign the packages. You can do this by running:

```bash
make regenerate
```

You can then build a specific package by running the following command within the package's directory:

```bash
make build
```
