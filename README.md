# Reproducible development environment talk

This repository contains the source files for the talk titled: "Reproducible development environment… without containers!".

## Slides

### Directory structure

Slides content and assets are located under the [`slides`](./slides) directory.

Assets are organized as follows:

- [`index.md`](./slides/index.md): slide content
- [`assets`](./slides/assets): assets files for the slides
  - [`assets/font`](./slides/assets/font): font used in the slides
  - [`assets/images`](./slides/assets/images): images used in the slides

### Generate

**With [Nix](https://nix.dev)**

```shell
# Generate
nix run '.#gen'

# Generate and watch
nix run '.#watch'
```

**With [Marp](https://marp.app)**

```shell
# Generate
marp slides

# Generate and watch
marp slides -w
```
