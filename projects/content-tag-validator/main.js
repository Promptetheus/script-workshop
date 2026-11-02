/**
 * Metadata Source Parser
 * 
 * This module provides a function to parse metadata from different sources and extract content tags.
 */

class MetadataSourceParser {
  /**
   * Parse metadata from different sources and extract content tags.
   * 
   * @param {Object} metadataSources - An object containing metadata sources.
   * @param {Object} options - An object containing options for the parser.
   * @returns {Object} An object containing the extracted content tags.
   */
  parseMetadata(metadataSources, options) {
    const extractedTags = {};

    for (const source in metadataSources) {
      if (metadataSources.hasOwnProperty(source)) {
        const sourceMetadata = metadataSources[source];
        const requiredTags = options.requiredTags || [];
        const tags = this.extractTags(sourceMetadata, requiredTags);

        for (const tag in tags) {
          if (tags.hasOwnProperty(tag)) {
            extractedTags[tag] = tags[tag];
          }
        }
      }
    }

    return extractedTags;
  }

  /**
   * Extract content tags from metadata.
   * 
   * @param {Object} metadata - The metadata object.
   * @param {Array} requiredTags - An array of required tags.
   * @returns {Object} An object containing the extracted content tags.
   */
  extractTags(metadata, requiredTags) {
    const extractedTags = {};

    for (const tag in metadata) {
      if (metadata.hasOwnProperty(tag)) {
        if (requiredTags.includes(tag)) {
          extractedTags[tag] = metadata[tag];
        }
      }
    }

    return extractedTags;
  }
}

// Example usage:
const metadataSources = {
  'source1': {
    'title': 'Example Title',
    'description': 'Example Description',
    'author': 'John Doe'
  },
  'source2': {
    'title': 'Example Title',
    'author': 'Jane Doe'
  }
};

const parser = new MetadataSourceParser();
const extractedTags = parser.parseMetadata(metadataSources, {
  requiredTags: ['title', 'description', 'author']
});

console.log(extractedTags);