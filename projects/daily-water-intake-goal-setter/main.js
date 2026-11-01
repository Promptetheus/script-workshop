/**
 * Calculates the daily water intake goal based on age, sex, and weight.
 *
 * @param {number} age - The user's age in years.
 * @param {string} sex - The user's sex, either 'male' or 'female'.
 * @param {number} weight - The user's weight in pounds.
 * @returns {number} The recommended daily water intake in ounces.
 */

function calculateDailyWaterIntake(age, sex, weight) {
    let waterIntake;

    if (sex.toLowerCase() === 'male') {
        waterIntake = 3.7 * weight;
    } else if (sex.toLowerCase() === 'female') {
        waterIntake = 2.7 * weight;
    } else {
        throw new Error('Invalid sex. Please enter either "male" or "female".');
    }

    if (age < 65) {
        waterIntake *= 1.2;
    } else if (age >= 65) {
        waterIntake *= 1.0;
    } else {
        throw new Error('Invalid age. Please enter a valid age.');
    }

    return Math.round(waterIntake * 100) / 100;
}

// Example usage:
try {
    const age = parseInt(prompt('Enter your age:'));
    const sex = prompt('Enter your sex (male/female):');
    const weight = parseInt(prompt('Enter your weight in pounds:'));
    const dailyWaterIntake = calculateDailyWaterIntake(age, sex, weight);
    alert(`Your daily water intake goal is ${dailyWaterIntake} ounces.`);
} catch (error) {
    alert(error.message);
}