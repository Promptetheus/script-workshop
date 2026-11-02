#!/usr/bin/env cmd

import json
import argparse

def parse_deadline_docket(file_path):
    """
    Parse the deadline docket JSON file and return a list of tasks.
    """
    with open(file_path, 'r') as file:
        data = json.load(file)
    return data['tasks']

def filter_tasks(tasks, project=None, category=None):
    """
    Filter tasks based on project and category.
    """
    filtered_tasks = []
    for task in tasks:
        if project and task['project'] != project:
            continue
        if category and task['category'] != category:
            continue
        filtered_tasks.append(task)
    return filtered_tasks

def get_upcoming_deadlines(tasks, days):
    """
    Get the upcoming deadlines for a given number of days.
    """
    upcoming_deadlines = []
    for task in tasks:
        deadline = task['deadline']
        if deadline['days'] >= days:
            upcoming_deadlines.append(deadline)
    return upcoming_deadlines

def print_upcoming_deadlines(deadlines):
    """
    Print the upcoming deadlines in a human-readable format.
    """
    for deadline in deadlines:
        print(f"Deadline: {deadline['date']}, Project: {deadline['project']}, Category: {deadline['category']}")

def main():
    parser = argparse.ArgumentParser(description='Generate a list of upcoming deadlines for a given deadline docket.')
    parser.add_argument('file_path', help='Path to the deadline docket JSON file.')
    parser.add_argument('--project', help='Filter by project.')
    parser.add_argument('--category', help='Filter by category.')
    parser.add_argument('--days', type=int, default=30, help='Number of days to display upcoming deadlines.')
    args = parser.parse_args()

    tasks = parse_deadline_docket(args.file_path)
    filtered_tasks = filter_tasks(tasks, args.project, args.category)
    upcoming_deadlines = get_upcoming_deadlines(filtered_tasks, args.days)
    print_upcoming_deadlines(upcoming_deadlines)

if __name__ == "__main__":
    main()