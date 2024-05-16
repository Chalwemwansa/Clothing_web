#!/usr/bin/env python3
"""adds some data to the products table in the rails server app running at port 3000"""
import requests


url = 'http://127.0.0.1:3000/product/6'

response = requests.delete(url)
print(f"server responded with response: {response.text}")
