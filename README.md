# README

* Ruby version ruby 2.6.6
* Rails version 5.1.7

* System dependencies
  - Devise
  - JWT
  - Active Model Serializers
  - Rack-Cors

* Database in Development
  - SQLite3

* Database in Production
  - PostgresSQL

* Server URL: https://api-restaurant-system.herokuapp.com/

* Server Routes:
  Category:
  - GET /categories
  - GET /categories/<category_id>
  - POST /categories:
    JSON: {"designation":"string"}
  - PUT/PATCH /categories/<category_id>:
    JSON: {"designation":"string"} 
  - DELETE /categories/<category_id>
  
  MenuItem:
  - GET /menu_items
  - GET /menu_items/<menu_item_id>
  - POST /menu_items:
    JSON: {"quantity": integer, "note": "string", "bill_id": integer, "menu_item_id":integer}
  - PUT/PATCH /menu_items/<menu_item_id>:
    JSON: {"quantity": integer, "note": "string", "bill_id": integer, "menu_item_id":integer, "order_status": integer}
  - DELETE /menu_items/<menu_item_id>

  Table
  - GET /tables
  - GET /tables/<table_id>
  - POST /tables:
    JSON: {"number": integer}
  - PUT/PATCH /tables/<table_id>:
    JSON: {"number": integer}
  - DELETE /tables/<table_id>

  Bill:
  - GET /bills
  - GET /bills/<bill_id>
  - POST /bills:
    JSON: {"table_number": integer, "table_id": integer}
  - POST /close_bill
  - PUT/PATCH /bills/<bill_id>:
    JSON: {"table_number": integer, "table_id": integer}
  - DELETE /bills/<bill_id>

  Order:
  - GET /bills/<bill_id>/orders
  - GET /bills/<bill_id>/orders/<order_id>
  - POST /bills/<bill_id>/orders:
    JSON: {"quantity": integer, "note": string, "bill_id": integer, "menu_item_id": integer, "order_status":integer}
  - PUT/PATCH /bills/<bill_id>/orders/<order_id>:
    JSON: {"quantity": integer, "note": string, "bill_id": integer, "menu_item_id": integer, "order_status":integer}
  - DELETE /bills/<bill_id>/orders/<order_id>

  User:
  - GET /users
  - GET /users/<user_id>
  - POST /sign_in:
    JSON: {"email": string, "password": string, "password_confirmation": string, "user_name": string, "role": string}
  - PUT/PATCH /users/<user_id>
  - DELETE /users/<user_id>

  Authentication:
  - POST /log_in:
    JSON: {"email":string, "password": string}

  Sale:
  - GET /sales
  - GET /sales/<sale_id>
  - DELETE /sales/<sale_id>