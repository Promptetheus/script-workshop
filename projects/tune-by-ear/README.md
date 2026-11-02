# tune_by_ear

Tune an instrument by ear with a reference pitch. The app will ask the user to input the reference pitch and then generate a series of notes to help the user tune their instrument. The app will then ask the user to input the notes they hear and provide feedback on how close they are to the reference pitch.

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

- main.lua: Implement a function that takes a reference pitch and generates a series of notes to help the user tune their instrument. The function should also take user input for the notes they hear and provide feedback on how close they are to the reference pitch.

## Validation

Paperclip performs static checks where supported and model QA. Generated code is not automatically execution-tested. A QA approval does not guarantee runtime correctness.

## Local diagnostics and privacy

The local `_paperclip/` folder contains PM output, QA, repairs, errors and aborted output for debugging. It is excluded from Git by `.gitignore` and is not included in Paperclip publication snapshots.
Credentials, environments, common local data and personal folders are also ignored. Keep personal data outside source files and review files before publication.
