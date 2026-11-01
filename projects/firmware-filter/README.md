# firmware_filter

Filter firmware catalog by search query and return compatible device list

## Requirements

Install the cmd runtime. No dependency installation has been performed.
This project is planned to use standard language facilities; inspect source imports before running.

## Run

```text
cmd /c main.cmd
```

Supply any command-line arguments required by the source. GUI projects open a desktop window. Review the source before running.

## Project files

- `main.cmd`

## Implemented tasks

- main.cmd: Implement a command-line interface to filter firmware catalog by search query and return compatible device list. The interface should accept a search query as input and output a list of compatible devices. The firmware catalog should be stored in a predefined format.

## Validation

Paperclip performs static checks where supported and model QA. Generated code is not automatically execution-tested. A QA approval does not guarantee runtime correctness.

## Local diagnostics and privacy

The local `_paperclip/` folder contains PM output, QA, repairs, errors and aborted output for debugging. It is excluded from Git by `.gitignore` and is not included in Paperclip publication snapshots.
Credentials, environments, common local data and personal folders are also ignored. Keep personal data outside source files and review files before publication.
