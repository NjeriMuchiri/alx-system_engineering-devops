#!/usr/bin/python3
""" This script uses JSON Placeholder
API to get information about employee tasks """
import csv
import requests
import sys


if __name__ == "__main__":
    url = 'https://jsonplaceholder.typicode.com/'
    user_id = sys.argv[1]
    user = '{}users/{}'.format(url, user_id)
    response = requests.get(user)
    json_object = response.json()
    name = json_object.get('username')

    todos = '{}todos?userId={}'.format(url, user_id)
    res = requests.get(todos)
    tasks = res.json()
    l_task = []
    for task in tasks:
        l_task.append([user_id,
                       name,
                       task.get('completed'),
                       task.get('title')])

    filename = '{}.csv'.format(user_id)
    with open(filename, mode='w') as employee_file:
        employee_writer = csv.writer(employee_file,
                                     delimiter=',',
                                     quotechar='"',
                                     quoting=csv.QUOTE_ALL)
        for task in l_task:
            employee_writer.writerow(task)
