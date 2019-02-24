# El-Training
[![Ruby version](https://img.shields.io/badge/Ruby-2.5.3-red.svg)]()
[![RoR version](https://img.shields.io/badge/Ruby%20on%20Rails-5.2.2-red.svg)]()
[![License MIT](https://img.shields.io/badge/License-MIT-lightgrey.svg)]()
[![CircleCI](https://img.shields.io/circleci/project/github/kaitofu/el-training.svg)]()

このアプリケーションは、RubyおよびRuby On Railsを用いた基本的なWebアプリケーション作成の学習過程において制作されたものです。

This application was created in the learning process of basic Web application creation by Ruby and Ruby On Rails.

### Curriculum
[株式会社万葉の新入社員教育用カリキュラム https://everyleaf.com/](https://github.com/everyleaf/el-training)

### Reference
[現場で使える Ruby on Rails 5速習実践ガイド](https://www.amazon.co.jp/%E7%8F%BE%E5%A0%B4%E3%81%A7%E4%BD%BF%E3%81%88%E3%82%8B-Ruby-Rails-5%E9%80%9F%E7%BF%92%E5%AE%9F%E8%B7%B5%E3%82%AC%E3%82%A4%E3%83%89-%E5%A4%A7%E5%A0%B4%E5%AF%A7%E5%AD%90/dp/4839962227)

## Published at:
https://el-training-koalamask.herokuapp.com/

#### The following User can be used:


[User as an admininstrator] email: test_user_a@example.com,  password: password

[Common user] email: test_user_b@example.com,  password: password
  

## Requirement
Ruby 2.5.3
Bundler 1.17.3, 
PostgreSQL 11.1

## Installation

1. Clone this repository
```
$ git clone git@github.com:koalamask/el-training.git
```

2. Move into your project
```
$ cd el-training
```

3. Install Ruby 2.5.3 (If nessesary) 
```
$ rbenv install 2.5.3
```

3. Set Ruby version to 2.53(If nessesary)
```
$ rbenv local 2.5.3
```

4. Install Bundler 1.17.3(If nessesary)
```
$ gem install bundler -v 1.17.3
```

5. Install gems
```
$ bundle install
```

6. Install PostgreSQL(If nessesary)
```
$ brew install postgresql
```

7. Start PostgreSQL(If nessesary)
```
$ brew services start postgresql
```

8. Create database
```
$ bin/rails db:create
```

9. Exec migration
```
$ bin/rails db:migrate RAILS_ENV=development
```

10. Create sample data(If nessesary)
```
$ rake db:seed
```

11. Build & run server
```
$ bin/rails s
```
Then, you can see app in `http://localhost:3000`


## Deployment instructions
### Initial deployment
1. Login Heroku
```
$ heroku login
```

2. Register remote repository to Heroku
```
$ heroku git:remote -a el-training-koalamask
```

3. Deploy application to server
```
$ git push heroku master
```

4. Exec database migration
```
$ heroku run bin/rails db:migrate
```

### Deployment for update
```
$ heroku login
$ git add -A
$ git commit -m "Update application"
$ git push heroku master

* If db had been changed
$ heroku run bin/rails db:migrate
```

## Table Schema

### Tables
| no. | name  |
| --- | ----- |
| 1   | Task  |
| 2   | Label |
| 3   | User  |


### Tasks Table
| column_name | data_type | not_null | default | auto increment | index | comments                                       |
| ----------- | --------- | -------- | ------- | -------------- | ----- | ---------------------------------------------- |
| task_id     | integer   | true     |         |                |       |                                                |
| name        | string    | true     |         |                | true      | [validation] until 30 characters         |
| priority    | integer   |          |         |                |       |                                                |
| description | text      |          |         |                |       |                                                |
| status      | string   | true     | "未着手"       |                |true       |  |
| user_id     | integer   | true         |         |                |   true    |     |
| deadline    | date      |          |         |                |       | [validation] should be today or later          |
| created_at  |           |          |         |                |       |                                                |
| updated_at  |           |          |         |                |       |                                                |


### Labels Table(Not created yet)
| column_name | data_type | not_null | default | auto increment | index | comments |
| ----------- | --------- | -------- | ------- | -------------- | ----- | -------- |
| label_id    | integer   | true     |         |                |       |          |
| name        | string    | true     |         |                |       |          |
| color       | string    | true     |         |                |       |          |
| created_at  |           |          |         |                |       |          |
| updated_at  |           |          |         |                |       |          |


### User Table
| column_name     | data_type | not_null | default | auto increment | index                                | comments |
| --------------- | --------- | -------- | ------- | -------------- | --------------------------------------- | ----- |
| user_id         | integer   | true     |         |                |                                         |       |
| name            | string    | true     |         |                |                                         |       |
| email           | string    | true     |         |                |  | [validation] should be based on RFC2822      |
| password_digest | string    | true     |         |                |                                         |       |
| admin           | boolean   | true     | false   |                |                                         |       |
| created_at      |           |          |         |                |                                         |       |
| updated_at      |           |          |         |                |                                         |       |


## License
This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/koalamask/el-training/blob/master/LICENSE.md) file for details
