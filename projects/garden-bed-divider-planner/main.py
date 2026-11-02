import math

def calculate_optimal_bed_size(width, height, plant_spacing):
    """
    Calculate the optimal bed size based on plant spacing and bed dimensions.

    Args:
        width (float): The width of the garden bed in inches.
        height (float): The height of the garden bed in inches.
        plant_spacing (float): The spacing between plants in inches.

    Returns:
        tuple: A tuple containing the optimal bed width and height.
    """
    optimal_bed_width = math.ceil(width / plant_spacing) * plant_spacing
    optimal_bed_height = math.ceil(height / plant_spacing) * plant_spacing
    return optimal_bed_width, optimal_bed_height


def divide_bed_into_sections(optimal_bed_width, optimal_bed_height, plant_spacing):
    """
    Divide the bed into sections based on the calculated bed size and plant spacing.

    Args:
        optimal_bed_width (float): The optimal bed width in inches.
        optimal_bed_height (float): The optimal bed height in inches.
        plant_spacing (float): The spacing between plants in inches.

    Returns:
        list: A list of section coordinates.
    """
    section_coordinates = []
    for i in range(0, optimal_bed_width, plant_spacing):
        for j in range(0, optimal_bed_height, plant_spacing):
            section_coordinates.append((i, j))
    return section_coordinates


def generate_layout_plan(section_coordinates, plant_type):
    """
    Generate a printable garden bed layout plan based on the section coordinates.

    Args:
        section_coordinates (list): A list of section coordinates.
        plant_type (str): The type of plant (e.g., tomato, carrot).

    Returns:
        str: A printable garden bed layout plan.
    """
    layout_plan = ""
    for i, (x, y) in enumerate(section_coordinates):
        layout_plan += f"Section {i+1}:\n"
        layout_plan += f"  Plant Type: {plant_type}\n"
        layout_plan += f"  Coordinates: ({x}, {y})\n"
        layout_plan += "\n"
    return layout_plan


def main():
    width = float(input("Enter the width of the garden bed in inches: "))
    height = float(input("Enter the height of the garden bed in inches: "))
    plant_spacing = float(input("Enter the spacing between plants in inches: "))
    plant_type = input("Enter the type of plant (e.g., tomato, carrot): ")

    optimal_bed_width, optimal_bed_height = calculate_optimal_bed_size(width, height, plant_spacing)
    section_coordinates = divide_bed_into_sections(optimal_bed_width, optimal_bed_height, plant_spacing)
    layout_plan = generate_layout_plan(section_coordinates, plant_type)

    print(layout_plan)
    with open("layout_plan.txt", "w") as file:
        file.write(layout_plan)


if __name__ == "__main__":
    main()