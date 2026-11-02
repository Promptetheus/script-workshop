# event_reminder_scheduler

Schedules reminders for upcoming community events based on event date and reminder time, checking if the event date is within a specified week range.

## Requirements

Install the powershell runtime. No dependency installation has been performed.
This project is planned to use standard language facilities; inspect source imports before running.

## Run

```text
powershell -NoProfile -File main.ps1
```

Supply any command-line arguments required by the source. GUI projects open a desktop window. Review the source before running.

## Project files

- `main.ps1`

## Implemented tasks

- main.ps1: Implement a function to schedule reminders for upcoming community events. The function should take an event date and reminder time as input, check if the event date is within a specified week range, and output a scheduled reminder notification.

## Validation

Paperclip performs static checks where supported and model QA. Generated code is not automatically execution-tested. A QA approval does not guarantee runtime correctness.

## Local diagnostics and privacy

The local `_paperclip/` folder contains PM output, QA, repairs, errors and aborted output for debugging. It is excluded from Git by `.gitignore` and is not included in Paperclip publication snapshots.
Credentials, environments, common local data and personal folders are also ignored. Keep personal data outside source files and review files before publication.
