#!/usr/bin/python3
""" This script uses JSON Placeholder
API to get information about employee tasks """

import requests
import json
import sys


if __name__ == "__main__":
    url = 'https://jsonplaceholder.typicode.com/'
    user = '{}users'.format(url)
    response = requests.get(user)
    json_object = response.json()
    task_done = {}

    for user in json_object:
        name = user.get('username')
        user_id = user.get('id')
        todos = '{}todos?userId={}'.format(url, user_id)
        response = requests.get(todos)
        tasks = response.json()
        task_to = []
        for task in tasks:
            dict_task = {"username": name,
                         "task": task.get('title'),
                         "completed": task.get('completed')}
            task_to.append(dict_task)

        task_done[str(user_id)] = task_to
    filename = 'todo_all_employees.json'
    with open(filename, mode='w') as f:
        json.dump(task_done, f)
