# audit_evidence_remover

Removes duplicate audit evidence files from a list of audit files. The input audit files are expected to be in a CSV format, where each file is a separate row. The output will be a list of unique audit files, also in CSV format.

## Requirements

Install the ruby runtime. No dependency installation has been performed.
This project is planned to use standard language facilities; inspect source imports before running.

## Run

```text
ruby main.rb
```

Supply any command-line arguments required by the source. GUI projects open a desktop window. Review the source before running.

## Project files

- `main.rb`

## Implemented tasks

- main.rb: Reads the list of audit files from the input CSV, removes duplicates, and writes the unique files to the output CSV. It also handles the QA parse error by skipping lines with extra data.

## Validation

Paperclip performs static checks where supported and model QA. Generated code is not automatically execution-tested. A QA approval does not guarantee runtime correctness.

## Local diagnostics and privacy

The local `_paperclip/` folder contains PM output, QA, repairs, errors and aborted output for debugging. It is excluded from Git by `.gitignore` and is not included in Paperclip publication snapshots.
Credentials, environments, common local data and personal folders are also ignored. Keep personal data outside source files and review files before publication.
