class IdeaManager:
    def __init__(self):
        self.ideas = {}

    def add_idea(self, title, description, relevance_score):
        """
        Add a new idea to the manager.

        Args:
            title (str): The title of the idea.
            description (str): The description of the idea.
            relevance_score (int): The relevance score of the idea.
        """
        self.ideas[title] = {"description": description, "relevance_score": relevance_score}

    def get_idea(self, title):
        """
        Get an idea by its title.

        Args:
            title (str): The title of the idea.

        Returns:
            dict: The idea if found, otherwise None.
        """
        return self.ideas.get(title)

    def update_idea(self, title, description=None, relevance_score=None):
        """
        Update an existing idea.

        Args:
            title (str): The title of the idea.
            description (str, optional): The new description of the idea. Defaults to None.
            relevance_score (int, optional): The new relevance score of the idea. Defaults to None.
        """
        idea = self.get_idea(title)
        if idea:
            if description:
                idea["description"] = description
            if relevance_score:
                idea["relevance_score"] = relevance_score

    def delete_idea(self, title):
        """
        Delete an idea by its title.

        Args:
            title (str): The title of the idea.
        """
        del self.ideas[title]


def main():
    manager = IdeaManager()

    while True:
        print("\n1. Add idea")
        print("2. Get idea")
        print("3. Update idea")
        print("4. Delete idea")
        print("5. Exit")

        choice = input("Choose an option: ")

        if choice == "1":
            title = input("Enter the title of the idea: ")
            description = input("Enter the description of the idea: ")
            relevance_score = int(input("Enter the relevance score of the idea: "))
            manager.add_idea(title, description, relevance_score)
        elif choice == "2":
            title = input("Enter the title of the idea: ")
            idea = manager.get_idea(title)
            if idea:
                print(f"Title: {idea['title']}")
                print(f"Description: {idea['description']}")
                print(f"Relevance Score: {idea['relevance_score']}")
            else:
                print("Idea not found.")
        elif choice == "3":
            title = input("Enter the title of the idea: ")
            description = input("Enter the new description of the idea (press Enter to skip): ")
            relevance_score = input("Enter the new relevance score of the idea (press Enter to skip): ")
            if description:
                manager.update_idea(title, description)
            if relevance_score:
                manager.update_idea(title, relevance_score=int(relevance_score))
        elif choice == "4":
            title = input("Enter the title of the idea: ")
            manager.delete_idea(title)
        elif choice == "5":
            break
        else:
            print("Invalid option. Please choose a valid option.")

if __name__ == "__main__":
    main()