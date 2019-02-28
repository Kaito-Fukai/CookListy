# Cooklisty.online
[![Ruby version](https://img.shields.io/badge/Ruby-2.3.7-red.svg)]()
[![RoR version](https://img.shields.io/badge/Ruby%20on%20Rails-5.1.6-red.svg)]()

### 調理スタート！までをお手伝いする、買い物リスト生成アプリケーションです。

## できること
- レシピの閲覧
本サービスに登録されたレシピを閲覧し、今日の献立を決められます。
![search](https://user-images.githubusercontent.com/36021748/53551204-0d803400-3b7c-11e9-846b-8c6941533beb.gif)

- 買い物リストの生成
選択したレシピから、ボタン一つで買い物リストを生成・管理できます。メールで送信することもできます。
![register_to_list](https://user-images.githubusercontent.com/36021748/53551260-386a8800-3b7c-11e9-83f7-c50222d97eae.gif)

買い物リストにはレシピを経由せず直接食材を登録することもできます。
![register_to_list_man](https://user-images.githubusercontent.com/36021748/53551202-0ce79d80-3b7c-11e9-97cb-ac37b0b59301.gif)


- ストックリストの作成
あらかじめ家にある食材を写真付きで登録できます。
![stocklist](https://user-images.githubusercontent.com/36021748/53551205-0d803400-3b7c-11e9-8b68-401b7da46a7a.gif)


## Published at:
http://cooklisty.online

#### The following Users can be used: ※要更新

[Common user] 

email: test_user_a@example.com,  password: vvv123
  
[User as an admininstrator] * Admin menu is placed at `/admin` path

email: test_user_a@example.com,  password: vvv123


## Requirement
Ruby >= 2.3.0

Bundler ~> 1.17.1

## Installation

1. Clone this repository
```
git@github.com:kaitofu/CookListy.git
```

2. Move into your project
```
$ cd CookListy
```

3. Install gems
```
$ bundle install
```

4. Create database
```
$ bin/rails db:create
```

5. Exec migration
```
$ bin/rails db:migrate RAILS_ENV=development
```

6. Create sample data(If nessesary)
```
$ rake db:seed_fu
```

7. Build & run server
```
$ rails s
```
Then, you can see app in `http://localhost:3000`
