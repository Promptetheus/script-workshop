/**
 * Document Similarity Checker
 * 
 * This script will compare two input documents and return the similarity score.
 * 
 * @author [Your Name]
 */

function calculateSimilarity(doc1, doc2) {
    // Convert the documents to lowercase and remove special characters
    doc1 = doc1.toLowerCase().replace(/[^a-zA-Z0-9\s]/g, '');
    doc2 = doc2.toLowerCase().replace(/[^a-zA-Z0-9\s]/g, '');

    // Split the documents into words
    let words1 = doc1.split(' ');
    let words2 = doc2.split(' ');

    // Calculate the intersection of the two sets of words
    let intersection = words1.filter(word => words2.includes(word));

    // Calculate the union of the two sets of words
    let union = [...new Set([...words1, ...words2])];

    // Calculate the Jaccard similarity coefficient
    let similarity = intersection.length / union.length;

    return similarity;
}

function main() {
    // Get the input documents from the user
    let doc1 = prompt("Enter the first document:");
    let doc2 = prompt("Enter the second document:");

    // Validate the input
    if (!doc1 || !doc2) {
        alert("Please enter both documents.");
        return;
    }

    // Calculate the similarity score
    let similarity = calculateSimilarity(doc1, doc2);

    // Display the result
    alert(`The similarity score between the two documents is: ${similarity}`);
}

main();