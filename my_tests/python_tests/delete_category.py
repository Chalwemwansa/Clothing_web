#!/usr/bin/env python3
"""adds some data to the products table in the rails server app running at port 3000"""
import requests


url = 'http://127.0.0.1:3000/category/'
data = {
    "category_name": 'example2@gmail.com'
        }

response = requests.delete(url, data=data)
print(f"server responded with response: {response.text}")
