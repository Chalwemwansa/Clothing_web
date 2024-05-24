#!/usr/bin/env python3
"""adds some data to the products table in the rails server app running at port 3000"""
import requests


url = 'http://127.0.0.1:3000/product'

data = {
    "category_name": "trousers",
    "name": "jeans",
    "price": 250.99,
    "description": "this is a very durable jean",
    "details": "can be washed any way you want",
    "shipping_details": "can be collected from monk square"
        }

response = requests.post(url, data=data)
print(f"server responded with response: {response.text}")
