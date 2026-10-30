# evidence_matrix_filter

A small Perl script that filters the evidence matrix by a specific keyword, allowing users to quickly find relevant information.

## Requirements

Install the perl runtime. No dependency installation has been performed.
This project is planned to use standard language facilities; inspect source imports before running.

## Run

```text
perl main.pl
```

Supply any command-line arguments required by the source. GUI projects open a desktop window. Review the source before running.

## Project files

- `main.pl`

## Implemented tasks

- main.pl: Implement a Perl script that takes a keyword and evidence matrix as input, searches for the keyword in the evidence matrix, and returns the matching rows as a JSON array.

## Validation

Paperclip performs static checks where supported and model QA. Generated code is not automatically execution-tested. A QA approval does not guarantee runtime correctness.

## Local diagnostics and privacy

The local `_paperclip/` folder contains PM output, QA, repairs, errors and aborted output for debugging. It is excluded from Git by `.gitignore` and is not included in Paperclip publication snapshots.
Credentials, environments, common local data and personal folders are also ignored. Keep personal data outside source files and review files before publication.
