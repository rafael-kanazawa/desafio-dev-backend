# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

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

* Serve Routes:
  Category:
  - GET /categories
  - POST /categories:
    JSON: {"designation":"string"}
  - PUT/PATCH /categories/:id:
    JSON: {"designation":"string"} 
  - DELETE /categories/:id
  
  MenuItem:
  - GET /menu_items
  - POST /menu_items:
    JSON: {}
   


