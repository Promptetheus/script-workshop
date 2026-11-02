# cpu_power_monitor

Displays the current CPU usage as a percentage, providing insights into system performance and potential bottlenecks.

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

- main.js: Create a GUI application that displays the current CPU usage as a percentage. The application should also provide insights into system performance and potential bottlenecks. The task should include the following inputs and outputs:
- Inputs: None
- Outputs: The current CPU usage as a percentage.
- Implementation Requirements:
  - Use the `process.cpuUsage()` function to get the current CPU usage.
  - Display the CPU usage as a percentage in a GUI element.
  - Provide insights into system performance and potential bottlenecks.
  - Use a suitable GUI library (e.g., React, Angular, Vue.js) to create the GUI application.
  - Ensure the application is responsive and updates the CPU usage in real-time.
  - Implement error handling to display an error message if the `process.cpuUsage()` function fails.
  - Use imports from none.

## Validation

Paperclip performs static checks where supported and model QA. Generated code is not automatically execution-tested. A QA approval does not guarantee runtime correctness.

## Local diagnostics and privacy

The local `_paperclip/` folder contains PM output, QA, repairs, errors and aborted output for debugging. It is excluded from Git by `.gitignore` and is not included in Paperclip publication snapshots.
Credentials, environments, common local data and personal folders are also ignored. Keep personal data outside source files and review files before publication.
