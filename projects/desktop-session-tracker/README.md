# desktop_session_tracker

A script to track and manage multiple desktop sessions on a single server. It allows users to monitor the active sessions, close idle sessions, and send notifications when a session becomes idle for a specified period of time.

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

- main.sh: session_monitor: Implement a script that monitors active desktop sessions, displays the list of active sessions, and allows users to close idle sessions. The script should also send notifications when a session becomes idle for a specified period of time.
notification_sender: Implement a feature that sends notifications when a session becomes idle for a specified period of time. The notification should include the session ID and the duration of inactivity.

## Validation

Paperclip performs static checks where supported and model QA. Generated code is not automatically execution-tested. A QA approval does not guarantee runtime correctness.

## Local diagnostics and privacy

The local `_paperclip/` folder contains PM output, QA, repairs, errors and aborted output for debugging. It is excluded from Git by `.gitignore` and is not included in Paperclip publication snapshots.
Credentials, environments, common local data and personal folders are also ignored. Keep personal data outside source files and review files before publication.
