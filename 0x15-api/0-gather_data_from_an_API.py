#!/usr/bin/python3
""" This script uses JSONPlaceholder API to get information
about employee ID"""
import requests
import sys


if __name__ == "__main__":
    url = 'https://jsonplaceholder.typicode.com/'
    user = '{}users/{}'.format(url, sys.argv[1])
    response = requests.get(user)
    json_obj = response.json()
    print("Employee {} is done with tasks"
          .format(json_obj.get('name')), end="")

    todos = '{}todos?userId={}'.format(url, sys.argv[1])
    response = requests.get(todos)
    tasks = response.json()
    task_to = []
    for task in tasks:
        if task.get('completed') is True:
            task_to.append(task)

    print("({}/{}):".format(len(task_to), len(tasks)))
    for task in task_to:
        print("\t {}".format(task.get("title")))
