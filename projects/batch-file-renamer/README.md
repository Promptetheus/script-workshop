# batch_file_renamer

Renames files within all subdirectories of a specified batch file directory.

## Requirements

Install the shell runtime. No dependency installation has been performed.
This project is planned to use standard language facilities; inspect source imports before running.

## Run

```text
sh main.sh
```

Supply any command-line arguments required by the source. GUI projects open a desktop window. Review the source before running.

## Project files

- `main.sh`

## Implemented tasks

- main.sh: Implement a recursive function to rename files within all subdirectories of the specified batch file directory. The function should take two arguments: the batch file directory and an optional output prefix. The function should return a list of the renamed files.

## Validation

Paperclip performs static checks where supported and model QA. Generated code is not automatically execution-tested. A QA approval does not guarantee runtime correctness.

## Local diagnostics and privacy

The local `_paperclip/` folder contains PM output, QA, repairs, errors and aborted output for debugging. It is excluded from Git by `.gitignore` and is not included in Paperclip publication snapshots.
Credentials, environments, common local data and personal folders are also ignored. Keep personal data outside source files and review files before publication.
