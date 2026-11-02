# deadline_docket_reminder

Generates a list of upcoming deadlines for a given deadline docket, allowing users to review and manage their tasks more efficiently.

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

- main.cmd: Generate a list of upcoming deadlines for a given deadline docket, allowing users to review and manage their tasks more efficiently. The script takes in a deadline docket JSON file, parses the tasks, and outputs a list of upcoming deadlines in a human-readable format. It also includes a filtering option to display deadlines for a specific project or task category.

## Validation

Paperclip performs static checks where supported and model QA. Generated code is not automatically execution-tested. A QA approval does not guarantee runtime correctness.

## Local diagnostics and privacy

The local `_paperclip/` folder contains PM output, QA, repairs, errors and aborted output for debugging. It is excluded from Git by `.gitignore` and is not included in Paperclip publication snapshots.
Credentials, environments, common local data and personal folders are also ignored. Keep personal data outside source files and review files before publication.
