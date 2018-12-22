# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## Table Schema

### Tables
| no. | name  |
| --- | ----- |
| 1   | Task  |
| 2   | Label |
| 3   | User  |


### Task Table
| column_name | data_type | not_null | default | auto increment | index                                       | comments                                 --- |     |
| ----------- | --------- | -------- | ------- | -------------- | ------------------------------------------- | -------------------------------------------- | --- |
| ta          | sk_id     | integer  | true    |                |                                             |                                              |     |
| nam         | e         | string   | true    |                |                                             |                                              |     |
| prio        | rity      | integer  |         |                |                                             |                                              |     |
| description | text      |          |         |                |                                             |                                              |     |
| status      | integer   | true     |         |                | use enum                                    |                                              |     |
| label_id    | integer   |          |         |                |                                             |                                              |     |
| user_id     | integer   |          |         |                | will be not_null after login function added |                                              |     |
| created_at  |           |          |         |                |                                             |                                              |     |
| updated_at  |           |          |         |                |                                             |                                              |     |


### Label Table
| column_name | data_type | not_null | default | auto increment | index | comments |
| ----------- | --------- | -------- | ------- | -------------- | ----- | -------- |
| label_id    | integer   | true     |         |                |       |          |
| name        | string    | true     |         |                |       |          |
| color       | string    | true     |         |                |       |          |
| created_at  |           |          |         |                |       |          |
| updated_at  |           |          |         |                |       |          |


### User Table
| column_name        | data_type | not_null | default | auto increment | index | comments |
| ------------------ | --------- | -------- | ------- | -------------- | ----- | -------- |
| user_id            | integer   | true     |         |                |       |          |
| name               | string    | true     |         |                |       |          |
| mail_address       | string    | true     |         |                |       |          |
| encrypted_password | text      | true     |         |                |       |          |
| is_unsubscribed    |           |          |         |                |       |          |
| created_at         |           |          |         |                |       |          |
| updated_at         |           |          |         |                |       |          |