# bookmark_prioritizer

Prioritizes bookmarks based on frequency of visit, last visited date, and user-defined tags. Returns a list of top 5 most visited bookmarks.

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

- main.lua: Implement a function to read bookmark data from a file, calculate the priority score for each bookmark, and return the top 5 most visited bookmarks. The priority score should be based on the frequency of visit, last visited date, and user-defined tags.

## Validation

Paperclip performs static checks where supported and model QA. Generated code is not automatically execution-tested. A QA approval does not guarantee runtime correctness.

## Local diagnostics and privacy

The local `_paperclip/` folder contains PM output, QA, repairs, errors and aborted output for debugging. It is excluded from Git by `.gitignore` and is not included in Paperclip publication snapshots.
Credentials, environments, common local data and personal folders are also ignored. Keep personal data outside source files and review files before publication.
