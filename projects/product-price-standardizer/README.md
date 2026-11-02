# product_price_standardizer

Standardizes product prices to a specific range, capping or scaling prices around a target value.

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

- main.lua: Implement a function that takes a product price and a target range as input, and returns the standardized price within the range.

## Validation

Paperclip performs static checks where supported and model QA. Generated code is not automatically execution-tested. A QA approval does not guarantee runtime correctness.

## Local diagnostics and privacy

The local `_paperclip/` folder contains PM output, QA, repairs, errors and aborted output for debugging. It is excluded from Git by `.gitignore` and is not included in Paperclip publication snapshots.
Credentials, environments, common local data and personal folders are also ignored. Keep personal data outside source files and review files before publication.
