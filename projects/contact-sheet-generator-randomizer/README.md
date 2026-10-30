# contact_sheet_generator_randomizer

Randomizes the order of contacts on a contact sheet, preserving the original group and name order. Inputs: contact list in CSV format. Outputs: contact sheet with randomized contact list, and a corresponding CSV file with the original contact list.

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

- main.sh: Generate a randomized contact list while preserving the original group and name order. Read the contact list from CSV format, shuffle the list, and write the randomized list to a new CSV file. Also, write the original contact list to a separate CSV file.

## Validation

Paperclip performs static checks where supported and model QA. Generated code is not automatically execution-tested. A QA approval does not guarantee runtime correctness.

## Local diagnostics and privacy

The local `_paperclip/` folder contains PM output, QA, repairs, errors and aborted output for debugging. It is excluded from Git by `.gitignore` and is not included in Paperclip publication snapshots.
Credentials, environments, common local data and personal folders are also ignored. Keep personal data outside source files and review files before publication.
