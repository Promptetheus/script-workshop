/**
 * Calculates the surface area of a 3D model given its dimensions.
 * 
 * @param {number} length - The length of the model.
 * @param {number} width - The width of the model.
 * @param {number} height - The height of the model.
 * @returns {number[][]} A 2D array representing the model's surface area.
 */
function calculateSurfaceArea(length, width, height) {
    // Validate user input
    if (length <= 0 || width <= 0 || height <= 0) {
        throw new Error("Dimensions must be positive numbers.");
    }

    // Calculate the surface area
    const surfaceArea = [
        // Top and bottom
        [length * width, length * width],
        [length * width, length * width],

        // Left and right
        [length * height, length * height],
        [length * height, length * height],

        // Front and back
        [width * height, width * height],
        [width * height, width * height]
    ];

    return surfaceArea;
}

// Example usage:
try {
    const surfaceArea = calculateSurfaceArea(10, 5, 3);
    console.log("Surface Area:");
    console.log(surfaceArea);
} catch (error) {
    console.error(error.message);
}