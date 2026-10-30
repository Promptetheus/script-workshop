import random
import string

def generate_idea(length=5):
    """
    Generate a unique idea of a specified length.
    
    Args:
    length (int): The length of the idea. Defaults to 5.
    
    Returns:
    str: A unique idea.
    """
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for _ in range(length))

def check_idea_duplicates(ideas, max_attempts):
    """
    Check for duplicate ideas and provide a rejection message if necessary.
    
    Args:
    ideas (list): A list of ideas to check.
    max_attempts (int): The maximum number of attempts to generate a unique idea.
    
    Returns:
    str: A unique idea if one is generated, otherwise a rejection message.
    """
    for _ in range(max_attempts):
        idea = generate_idea()
        if idea not in ideas:
            return idea
    return "Failed to generate a unique idea after {} attempts.".format(max_attempts)

def main():
    ideas = []
    max_attempts = 3
    
    while True:
        idea = input("Enter a unique idea for your catalog project: ")
        if idea not in ideas:
            ideas.append(idea)
            break
        else:
            print("Idea already exists. Please try again.")
            ideas = []
    
    unique_idea = check_idea_duplicates(ideas, max_attempts)
    print("Your unique idea is: {}".format(unique_idea))

if __name__ == "__main__":
    main()