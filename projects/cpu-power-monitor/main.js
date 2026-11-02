// Import the required modules
const { GUI } = require('gui');
const { dialog } = require('dialog');
const { messagebox } = require('messagebox');

// Create a new GUI application
const app = new GUI({
  title: 'CPU Usage Monitor',
  width: 400,
  height: 200,
  resizable: true,
  show: true,
});

// Create a label to display the CPU usage
const cpuUsageLabel = app.addLabel({
  text: 'CPU Usage: 0%',
  x: 10,
  y: 10,
  width: 380,
  height: 20,
  font: 'Arial',
  fontSize: 14,
  color: '#000000',
});

// Create a label to display the system performance insights
const performanceLabel = app.addLabel({
  text: 'System Performance: OK',
  x: 10,
  y: 40,
  width: 380,
  height: 20,
  font: 'Arial',
  fontSize: 14,
  color: '#000000',
});

// Function to get the current CPU usage
function getCpuUsage() {
  process.cpuUsage((err, cpuUsage) => {
    if (err) {
      // Display an error message if the function fails
      messagebox.show('Error', 'Failed to get CPU usage:', 'error');
    } else {
      // Update the CPU usage label
      cpuUsageLabel.setText(`CPU Usage: ${cpuUsage.percent}%`);
      // Update the system performance insights label
      performanceLabel.setText(`System Performance: OK`);
    }
  });
}

// Function to update the system performance insights
function updateSystemPerformance() {
  // Simulate a system performance check
  const systemPerformance = Math.floor(Math.random() * 100);
  performanceLabel.setText(`System Performance: ${systemPerformance}%`);
}

// Function to handle the GUI event
function handleEvent() {
  getCpuUsage();
  updateSystemPerformance();
}

// Add an event handler to the GUI application
app.on('guiEvent', handleEvent);

// Start the GUI event loop
app.start();