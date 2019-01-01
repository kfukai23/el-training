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
| column_name | data_type | not_null | default | auto increment | index | comments                                       |
| ----------- | --------- | -------- | ------- | -------------- | ----- | ---------------------------------------------- |
| task_id     | integer   | true     |         |                |       |                                                |
| name        | string    | true     |         |                |       | [validation] until 30 characters               |
| priority    | integer   |          |         |                |       |                                                |
| description | text      |          |         |                |       |                                                |
| status      | integer   | true     | 0       |                |       | [use enum] 0: not yet, 1: in progress, 2: done |
| label_id    | integer   |          |         |                |       |                                                |
| user_id     | integer   |          |         |                |       | will be not_null after login function added    |
| deadline    | date      |          |         |                |       | [validation] should be today or later          |
| created_at  |           |          |         |                |       |                                                |
| updated_at  |           |          |         |                |       |                                                |


### Label Table
| column_name | data_type | not_null | default | auto increment | index | comments |
| ----------- | --------- | -------- | ------- | -------------- | ----- | -------- |
| label_id    | integer   | true     |         |                |       |          |
| name        | string    | true     |         |                |       |          |
| color       | string    | true     |         |                |       |          |
| created_at  |           |          |         |                |       |          |
| updated_at  |           |          |         |                |       |          |


### User Table
| column_name        | data_type | not_null | default | auto increment | comments                                | index |
| ------------------ | --------- | -------- | ------- | -------------- | --------------------------------------- | ----- |
| user_id            | integer   | true     |         |                |                                         |       |
| name               | string    | true     |         |                |                                         |       |
| mail_address       | string    | true     |         |                | [validation] should be based on RFC2822 |       |
| encrypted_password | text      | true     |         |                |                                         |       |
| is_unsubscribed    | boolean   | true     | false   |                |                                         |       |
| created_at         |           |          |         |                |                                         |       |
| updated_at         |           |          |         |                |                                         |       |


## Project Schedule:
https://docs.google.com/spreadsheets/d/1Dm5GPaeZZ2hnU8SnUpZlDOZFFXtPF6fCtXM-2Nrud2A/edit#gid=0
