/**
 * Calculates the remaining battery capacity based on Ah and Wh values, 
 * taking into account the depth cycles and charge percentage.
 * 
 * @param {number} ah - The battery's capacity in Ampere-hours (Ah).
 * @param {number} wh - The battery's capacity in Watt-hours (Wh).
 * @param {number} depthCycles - The number of depth cycles the battery has been subjected to.
 * @param {number} chargePercentage - The current charge percentage of the battery.
 * @returns {number} The remaining battery capacity in Wh.
 */
function calculateRemainingCapacity(ah, wh, depthCycles, chargePercentage) {
    // Calculate the remaining capacity based on the charge percentage
    let remainingCapacity = (chargePercentage / 100) * wh;
    
    // Apply a capacity reduction factor based on the depth cycles
    let capacityReductionFactor = 1 - (depthCycles / 1000);
    remainingCapacity *= capacityReductionFactor;
    
    return remainingCapacity;
}

// Example usage:
let ah = 50;  // Battery capacity in Ah
let wh = 100;  // Battery capacity in Wh
let depthCycles = 500;  // Number of depth cycles
let chargePercentage = 80;  // Current charge percentage

let remainingCapacity = calculateRemainingCapacity(ah, wh, depthCycles, chargePercentage);
console.log(`Remaining battery capacity: ${remainingCapacity} Wh`);