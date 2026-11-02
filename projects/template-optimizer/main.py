import re

def parse_template(template):
    """
    Parse a document template and identify unnecessary sections.
    """
    # Define a regular expression pattern to match unnecessary sections
    pattern = re.compile(r'\n\s*\n\s*---\s*\n\s*---\s*\n')

    # Split the template into sections
    sections = pattern.split(template)

    # Initialize an empty list to store the parsed sections
    parsed_sections = []

    # Iterate over each section
    for section in sections:
        # Remove leading and trailing whitespace
        section = section.strip()

        # If the section is not empty, add it to the parsed sections
        if section:
            parsed_sections.append(section)

    # Join the parsed sections back into a single string
    parsed_template = '\n'.join(parsed_sections)

    return parsed_template

def main():
    # Load the template from a file (not implemented in this example)
    # template = open('template.txt', 'r').read()

    # Parse the template
    parsed_template = parse_template('''
    --- Template Section ---
    This is a template section.
    --- End of Template Section ---
    --- Another Template Section ---
    This is another template section.
    --- End of Another Template Section ---
    ''')

    # Print the parsed template
    print(parsed_template)

if __name__ == '__main__':
    main()