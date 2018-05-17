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
# smart
# smart

------

## Staff

create staff model for [弊社管理者] role

```command
rails g devise Staff
```

create views set for staff model

```command
rails g devise:views staffs
```

and also change config/initializers/devise.rb

```ruby
config.scoped_views = true
```

set redirector like the following in ApplicationController(app/controllers/application_controller.rb) as well

- User
- Staff

2点のdevise利用したモデルが存在するので、以下の通りに追加しております

```ruby
private
  # set for devise login redirector
  def after_sign_in_path_for(resource)
    case resource
    when User
      # put here for User first page direct path after signed in
      # your_home_path
    when Staff
    else
      super
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when User, :user, :users
      new_user_session_path
      # put here for User default page direct path after signed out
    when Staff, :staff, :staffs
      new_staff_session_path
      # put here for Staff default page direct path after signed out
    else
      super
    end
  end
```

Staff のログイン関連のviews

app/views/staffs/ 直下に一式設置<br/>
このディレクトリのファイルを編集することで
Staff用の画面内容を変更できます


## User

User モデルのログインセッションチェック及び、ログイン中にのみ、出勤・退勤のボタン押下できるようにするため
MainController (app/controllers/main_controller.rb) を追加
このコントローラーを継承することでログイン中のいかなる処理も必ずログインセッションのチェックをすることが可能になる

## Attend

出勤／退勤の登録

```teminal
rails g scaffold attend user:belongs_to
```

## 帳票

User Thinreports<br/>
http://www.thinreports.org/

Gemfile
```ruby
gem 'thinreports'
```

config/application.rb

```ruby
# Thinreports
config.autoload_paths += %W(#{config.root}/app/reports)
```

app/reports ディレクトリを追加<br/>
帳票系のレイアウトファイルを保持するディレクトリ<br/>
application.rb に追加した行はこのディレクトリにパスを通す意味合い

sample

```
app/reports/layouts/salary.tlf
```

app/controllers/workers_controller.rb

```ruby
# 帳票出力処理
def print
  ...
  # (処理内容は実際のcontrollerを参照ください)
  ...
end
```
