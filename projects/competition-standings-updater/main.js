/**
 * Updates the competition standings by recalculating the rankings based on the latest results.
 */

class CompetitionStandings {
  constructor() {
    this.standings = [];
  }

  /**
   * Adds a new result to the standings.
   * @param {number} score - The score of the competitor.
   * @param {string} name - The name of the competitor.
   */
  addResult(score, name) {
    this.standings.push({ score, name });
  }

  /**
   * Updates the standings by recalculating the rankings based on the latest results.
   * @returns {Array} The updated standings.
   */
  updateStandings() {
    // Sort the standings in descending order based on the score
    this.standings.sort((a, b) => b.score - a.score);

    // Initialize the updated standings with the first competitor
    const updatedStandings = [this.standings[0]];

    // Iterate over the remaining competitors
    for (let i = 1; i < this.standings.length; i++) {
      // Find the position where the current competitor should be inserted
      let j = 0;
      while (j < updatedStandings.length && updatedStandings[j].score >= this.standings[i].score) {
        j++;
      }

      // Insert the current competitor at the correct position
      updatedStandings.splice(j, 0, this.standings[i]);
    }

    return updatedStandings;
  }
}

// Example usage:
const competition = new CompetitionStandings();
competition.addResult(100, 'John');
competition.addResult(80, 'Alice');
competition.addResult(90, 'Bob');

const updatedStandings = competition.updateStandings();
console.log(updatedStandings);