#!/usr/bin/python3
""" Ths script uses JSON Placeholder API
to get information about employee tasks to do """
import json
import requests
import sys


if __name__ == "__main__":
    url = 'https://jsonplaceholder.typicode.com/'
    user_id = sys.argv[1]
    user = '{}users/{}'.format(url, user_id)
    response = requests.get(user)
    json_obj = response.json()
    name = json_obj.get('username')

    todos = '{}todos?userId={}'.format(url, user_id)
    response = requests.get(todos)
    tasks = response.json()
    task_to = []
    for task in tasks:
        dictio_task = {"task": task.get('title'),
                       "completed": task.get('completed'),
                       "username": name}
        task_to.append(dictio_task)

    task_done = {str(user_id): task_to}
    filename = '{}.json'.format(user_id)
    with open(filename, mode='w') as f:
        json.dump(task_done, f)
