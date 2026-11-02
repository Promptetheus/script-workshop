/**
 * Citation Style Parser
 * 
 * Formats citation information for a literature review given a citation style and input citation details.
 */

function parseCitationStyle(citationStyle) {
    // Define a dictionary to map citation styles to their respective parsing functions
    const citationStyles = {
        'APA': apaParser,
        'MLA': mlaParser,
        'Chicago': chicagoParser
    };

    // Check if the citation style is supported
    if (!(citationStyle in citationStyles)) {
        throw new Error(`Unsupported citation style: ${citationStyle}`);
    }

    // Parse the citation style
    const parsedStyle = citationStyles[citationStyle]();

    // Extract relevant information from the parsed citation style
    const citationDetails = extractCitationDetails(parsedStyle);

    // Format the citation information
    const formattedCitation = formatCitation(citationDetails);

    return formattedCitation;
}

// Define a function to parse the APA citation style
function apaParser() {
    // For APA style, we need to extract the author, year, title, and journal name
    return {
        author: '',
        year: '',
        title: '',
        journal: ''
    };
}

// Define a function to parse the MLA citation style
function mlaParser() {
    // For MLA style, we need to extract the author, title, and journal name
    return {
        author: '',
        title: '',
        journal: ''
    };
}

// Define a function to parse the Chicago citation style
function chicagoParser() {
    // For Chicago style, we need to extract the author, title, and journal name
    return {
        author: '',
        title: '',
        journal: ''
    };
}

// Define a function to extract relevant information from the parsed citation style
function extractCitationDetails(parsedStyle) {
    // For APA style, we need to extract the author, year, title, and journal name
    if (parsedStyle.author === '') {
        throw new Error('Author not provided');
    }
    if (parsedStyle.year === '') {
        throw new Error('Year not provided');
    }
    if (parsedStyle.title === '') {
        throw new Error('Title not provided');
    }
    if (parsedStyle.journal === '') {
        throw new Error('Journal not provided');
    }

    return parsedStyle;
}

// Define a function to format the citation information
function formatCitation(citationDetails) {
    // For APA style, we need to format the citation as: Author, Year, Title, Journal
    return `${citationDetails.author}, ${citationDetails.year}, ${citationDetails.title}, ${citationDetails.journal}`;
}

// Define a function to get user input for citation style and details
function getUserInput() {
    const citationStyle = prompt('Enter the citation style (APA, MLA, Chicago): ');
    const author = prompt('Enter the author name: ');
    const year = prompt('Enter the year of publication: ');
    const title = prompt('Enter the title of the publication: ');
    const journal = prompt('Enter the journal name: ');

    return {
        citationStyle,
        author,
        year,
        title,
        journal
    };
}

// Define the main function
function main() {
    const userInput = getUserInput();
    const formattedCitation = parseCitationStyle(userInput.citationStyle);
    alert(formattedCitation);
}

// Call the main function
main();