#!/usr/bin/env python3
"""adds some data to the products table in the rails server app running at port 3000"""
import requests


url = 'http://127.0.0.1:3000/product/9'

data = {
    "category_name": "short",
    "name": "bemuda",
    "price": 25.4,
    "description": "this is a very durable product",
    "details": "can be washed any way you want",
    "shipping_details": "can be collected from monk square"
        }

response = requests.put(url, data=data)
print(f"server responded with response: {response.text}")
