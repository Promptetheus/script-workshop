/**
 * Calculates the percentage difference between the maximum and minimum box sizes in a CSS grid container.
 * 
 * @param {string} cssGridContainer - The CSS grid container as a string.
 * @returns {object} A JSON object containing the percentage difference for each grid item.
 */
function calculateBoxSizePercentageDifference(cssGridContainer) {
    // Parse the CSS grid container string to extract the grid items and their box sizes.
    const gridItems = cssGridContainer.match(/grid-item\s*{([^}]*)}/g);

    // Initialize an object to store the box sizes and their corresponding grid items.
    const boxSizes = {};

    // Iterate over each grid item.
    gridItems.forEach((item) => {
        // Extract the box size from the grid item string.
        const size = item.match(/grid-template-areas\s*:\s*([^}]*)/)[1].trim();

        // Split the box size string into individual sizes.
        const sizes = size.split(',');

        // Iterate over each size.
        sizes.forEach((size) => {
            // Extract the width and height from the size string.
            const [width, height] = size.trim().split('x');

            // Store the box size and its corresponding grid item.
            boxSizes[item.match(/grid-item\s*{([^}]*)}/)[1].trim()] = {
                width: parseInt(width),
                height: parseInt(height),
            };
        });
    });

    // Initialize an object to store the percentage differences for each grid item.
    const percentageDifferences = {};

    // Iterate over each grid item.
    Object.keys(boxSizes).forEach((item) => {
        // Calculate the maximum and minimum box sizes.
        const maxBoxSize = Math.max(...Object.values(boxSizes[item]).map((size) => size.width + size.height));
        const minBoxSize = Math.min(...Object.values(boxSizes[item]).map((size) => size.width + size.height));

        // Calculate the percentage difference.
        const percentageDifference = ((maxBoxSize - minBoxSize) / minBoxSize) * 100;

        // Store the percentage difference.
        percentageDifferences[item] = percentageDifference;
    });

    // Return the percentage differences as a JSON object.
    return percentageDifferences;
}

// Example usage:
const cssGridContainer = `
.grid-container {
    display: grid;
    grid-template-areas:
        'header header'
        'content content'
        'footer footer';
}

.grid-item {
    width: 100px;
    height: 100px;
    background-color: red;
}

.grid-item:nth-child(1) {
    width: 200px;
    height: 200px;
    background-color: blue;
}

.grid-item:nth-child(2) {
    width: 300px;
    height: 300px;
    background-color: green;
}
`;

const percentageDifferences = calculateBoxSizePercentageDifference(cssGridContainer);
console.log(percentageDifferences);