# alert_rule_validator

Verifies if an existing alert rule meets specific criteria, reducing false positives and improving alert rule effectiveness.

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

- main.pl: Implement the Alert Rule Validator in Perl, including input validation, rule verification, and output generation. The script should take the following command-line arguments: <rule_name>, <trigger_days>, and <trigger_hours>. It should also handle exceptions and errors properly.

## Validation

Paperclip performs static checks where supported and model QA. Generated code is not automatically execution-tested. A QA approval does not guarantee runtime correctness.

## Local diagnostics and privacy

The local `_paperclip/` folder contains PM output, QA, repairs, errors and aborted output for debugging. It is excluded from Git by `.gitignore` and is not included in Paperclip publication snapshots.
Credentials, environments, common local data and personal folders are also ignored. Keep personal data outside source files and review files before publication.
