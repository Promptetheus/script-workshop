# grid-box-sizer

Verifies that the size of grid boxes in a responsive layout remains constant across different screen sizes.

## Requirements

Install the javascript runtime. No dependency installation has been performed.
This project is planned to use standard language facilities; inspect source imports before running.

## Run

```text
node main.js
```

Supply any command-line arguments required by the source. GUI projects open a desktop window. Review the source before running.

## Project files

- `main.js`

## Implemented tasks

- main.js: Implement a function to calculate the percentage difference between the maximum and minimum box sizes in a CSS grid container with box-sizing set to 'border-box'. The function should take the CSS grid container as an input, extract the grid items, calculate their box sizes, find the maximum and minimum box sizes, and return a JSON object containing the percentage difference for each grid item.

## Validation

Paperclip performs static checks where supported and model QA. Generated code is not automatically execution-tested. A QA approval does not guarantee runtime correctness.

## Local diagnostics and privacy

The local `_paperclip/` folder contains PM output, QA, repairs, errors and aborted output for debugging. It is excluded from Git by `.gitignore` and is not included in Paperclip publication snapshots.
Credentials, environments, common local data and personal folders are also ignored. Keep personal data outside source files and review files before publication.
