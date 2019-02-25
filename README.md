# Cooklisty.online
[![Ruby version](https://img.shields.io/badge/Ruby-2.5.3-red.svg)]()
[![RoR version](https://img.shields.io/badge/Ruby%20on%20Rails-5.1.6-red.svg)]()

### 調理スタート！までをお手伝いする、買い物リスト生成アプリケーションです。

## できること
- レシピの閲覧
本サービスに登録されたレシピを閲覧し、今日の献立を決められます。
*スクショ

- 買い物リストの生成
選択したレシピから、ボタン一つで買い物リストを生成・管理できます。メールで送信することもできます。
*スクショ

- ストックリストの作成
あらかじめ家にある食材を写真付きで登録できます。
*スクショ

## Published at:
http://cooklisty.online

#### The following User can be used: ※要更新

[User as an admininstrator] email: test_user_a@example.com,  password: password

[Common user] email: test_user_b@example.com,  password: password
  

## Requirement
Ruby *要追記
Bundler 1.16.1

## Installation *要更新

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
