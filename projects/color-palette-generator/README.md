# color_palette_generator

Generates a color palette for a dashboard based on a single input color. The palette consists of 3 colors: primary, secondary, and background.

## Requirements

Install the lua runtime. No dependency installation has been performed.
This project is planned to use standard language facilities; inspect source imports before running.

## Run

```text
lua main.lua
```

Supply any command-line arguments required by the source. GUI projects open a desktop window. Review the source before running.

## Project files

- `main.lua`

## Implemented tasks

- main.lua: Implement a function to generate a color palette based on a single input color. The palette should consist of 3 colors: primary, secondary, and background. The primary color is the input color, the secondary color is a gradient between the input color and a default secondary color, and the background color is a default background color.

## Validation

Paperclip performs static checks where supported and model QA. Generated code is not automatically execution-tested. A QA approval does not guarantee runtime correctness.

## Local diagnostics and privacy

The local `_paperclip/` folder contains PM output, QA, repairs, errors and aborted output for debugging. It is excluded from Git by `.gitignore` and is not included in Paperclip publication snapshots.
Credentials, environments, common local data and personal folders are also ignored. Keep personal data outside source files and review files before publication.
