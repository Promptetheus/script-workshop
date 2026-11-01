/**
 * Inference Benchmark Filter functionality
 */

// Function to filter and sort inference benchmarks
function filterAndSortBenchmarks(benchmarks, parameter, order) {
    // Check if the parameter is valid
    if (['time', 'memory', 'throughput'].indexOf(parameter) === -1) {
        throw new Error("Invalid parameter. Supported parameters are 'time', 'memory', and 'throughput'.");
    }

    // Filter the benchmarks based on the specified parameter
    let filteredBenchmarks = benchmarks.filter(benchmark => {
        switch (parameter) {
            case 'time':
                return benchmark.time !== null && benchmark.time !== undefined;
            case 'memory':
                return benchmark.memory !== null && benchmark.memory !== undefined;
            case 'throughput':
                return benchmark.throughput !== null && benchmark.throughput !== undefined;
            default:
                throw new Error("Unsupported parameter.");
        }
    });

    // Sort the filtered benchmarks based on the specified order
    if (order === 'asc') {
        filteredBenchmarks.sort((a, b) => {
            switch (parameter) {
                case 'time':
                    return a.time - b.time;
                case 'memory':
                    return a.memory - b.memory;
                case 'throughput':
                    return b.throughput - a.throughput;
                default:
                    throw new Error("Unsupported parameter.");
            }
        });
    } else if (order === 'desc') {
        filteredBenchmarks.sort((a, b) => {
            switch (parameter) {
                case 'time':
                    return b.time - a.time;
                case 'memory':
                    return b.memory - a.memory;
                case 'throughput':
                    return a.throughput - b.throughput;
                default:
                    throw new Error("Unsupported parameter.");
            }
        });
    } else {
        throw new Error("Invalid order. Supported orders are 'asc' and 'desc'.");
    }

    return filteredBenchmarks;
}

// Example usage:
let benchmarks = [
    { name: 'Benchmark 1', time: 10, memory: 100, throughput: 1000 },
    { name: 'Benchmark 2', time: 20, memory: 200, throughput: 2000 },
    { name: 'Benchmark 3', time: 30, memory: 300, throughput: 3000 },
];

let filteredBenchmarks = filterAndSortBenchmarks(benchmarks, 'time', 'asc');
filteredBenchmarks.forEach(benchmark => {
    console.log(benchmark.name, benchmark.time, benchmark.memory, benchmark.throughput);
});