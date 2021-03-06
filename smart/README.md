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

## (1)(2)の制作
### Staff

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

* after_sign_in_path_for

  User（ユーザー）やStaff（「弊社管理者」）がログインした後にどの画面に遷移するかを記載

* after_sign_out_path_for

  User（ユーザー）やStaff（「弊社管理者」）がログアウトした後にどの画面に遷移するかを記載

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

#### User のログイン関連のviews

app/views/devise -> app/views/users
<br/>
にディレクトリを変更しております

#### Staff のログイン関連のviews

app/views/staffs/ 直下に一式設置<br/>
このディレクトリのファイルを編集することで
Staff用の画面内容を変更できます

app/views/layouts/staffs.html.erb
<br/>
「弊社管理画面」レイアウトがユーザー画面とレイアウトが違う場合は上記をご利用くださいませ。

#### devise関連の画面項目名
* config/locales/devise.ja.yml

上記を編集いただくことで日本語化することができます。

合わせて、以下のファイルも日本語エラーメッセージを表示するのに必要ですので追加しております。
* config/locales/ja.yml

## (3)の制作
### User

User モデルのログインセッションチェック及び、ログイン中にのみ、出勤・退勤のボタン押下できるようにするため
MainController (app/controllers/main_controller.rb) を追加
このコントローラーを継承することでログイン中のいかなる処理も必ずログインセッションのチェックをすることが可能になる

### Attend

出勤／退勤の登録

```teminal
rails g scaffold attend user:belongs_to
```

app/views/home/index.html.erb
<br/>
出勤・退勤のボタン押下のサンプル処理を追加

app/controllers/attends_controller.rb
<br/>
start：出勤ボタン押下した際の登録処理
<br/>
finish：退勤ボタン押下した際の登録処理

```ruby
  def start
    ...
  end

  def finish
    ...
  end
```

## (4)の制作
### 帳票

Use Thinreports<br/>
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

## (5)の制作
### db/migrateの編集
#### 編集したテーブル
* rurles：managementsテーブル、usersテーブルのリレーションを追加、整数型・日付型のカラムを修正
* users：managementsテーブル、workersテーブルのリレーションを追加

#### 追加したテーブル
* staffs：「弊社管理」ログイン用の従業員モデル・テーブル
* attends：出席・退勤を保存するモデル・テーブル


# 2018.05.18 [1]
- - -
## (2)新規作成画面

新規作成用のdeviseのコントローラーをカスタマイズ

```terminal
rails g devise:controllers users -c=registrations
```

app/controllers/users/registrations_controller.rb の以下のメソッドを編集

```ruby
# GET /resource/sign_up
def new
  # 実際のcontrollerの内容を参照ください
end

# POST /resource
def create
  # 実際のcontrollerの内容を参照ください
end
```

app/views/users/registrations/new.html.erb に追記

```html
<div class="field">
  <%= label :management, :company %><br />
  <%= text_field :management, :company %>
</div>
<div class="field">
  <%= label :management, :company_short %><br />
  <%= text_field :management, :company_short %>
</div>
<%# 上記と同様にしてmanagementsテーブルで必要な項目を追加していってください %>

<div class="field">
  <%= label :rule, :trial_period_start_on %><br />
  <%= date_field :rule, :trial_period_start_on %>
</div>
<div class="field">
  <%= label :rule, :trial_period_end_on %><br />
  <%= date_field :rule, :trial_period_end_on %>
</div>
<%# 上記と同様にしてrulesテーブルで必要な項目を追加していってください %>
```

routes.rb に以下を追記
```ruby
devise_for :users, controllers: {
  registrations: 'users/registrations'
}
```

## (4)出勤簿・賃金台帳への反映

app/controllers/attends_controller.rb の #printメソッドを参照くださいませ

データの取得方法を記載しております

これを元に画面を作成いただければと思います

このメソッドは給与明細印刷に利用しているメソッドです

出力しているデータは出勤・退勤ボタンを押下した際に取得したデータをそのまま表示しております

- - -

# 2018.05.22 [1]

## Staffレイアウト

app/controllers/application_controller.rb に以下を追記

```ruby
layout :layout_by_resource

...
private
...
  # Layout per resource_name
  def layout_by_resource
    if devise_controller? && resource_name == :staff
      "staffs"
    else
      "application"
    end
  end
```

app/views/layouts/staffs.html.erb を編集

「ログイン」→「ログイン(staff)」

```html
<% if staff_signed_in? %>
<!-- current_user は現在ログインしているUserオブジェクトを返すdeviseのHelperメソッド -->
<!-- *_path はUserモデルを作成したときに、deviseにより自動で作成されてますので、rake routesで確認できます -->
        <strong><% current_user.email  %></strong>
            <%= link_to "ログアウト", destroy_staff_session_path, method: :delete %>
<% else %>
            <%= link_to "ログイン(staff)", new_staff_session_path%>
 <% end %>
```

* users でアクセス

  /users/sign_in

  ヘッダーメニュー「ログイン」になっている

* staffs でアクセス

  /staffs/sign_in

  ヘッダーメニュー「ログイン(staff)」になっている

それぞれでアクセスして確認くださいませ。

- - -
# 2018.05.28 [1]
## bugfix : homeの「テストプリント」ボタン押下を修正

app/views/home/index.html.erb

```html
<%- if @current_attend.present? -%>

を以下に修正

<%- if current_user.present? && current_user.attends.exists? -%>
```

app/controllers/workers_controller.rb

  end_atがnilの場合、exception発生を修正しました。

```ruby
work_time: "#{I18n.l(item.start_at, format: :xs)}-#{I18n.l(item.end_at, format: :xs)}",

を以下に修正

_start_at = item.start_at.present? ? I18n.l(item.start_at, format: :xs) : nil
_end_at   = item.end_at.present? ? I18n.l(item.end_at, format: :xs) : nil
...
work_time: "#{_start_at}-#{_end_at}",
...
```

- - -
# 2018.06.11 [1]
## (3)(4)→app/controllers/workers_controller.rb#print に休憩ロジック

* app/controllers/attends_controller.rb

  以下を追加しております

  ```ruby
  # 休憩開始
  def rest_time_start
    ...
    # 実際のロジックを参照ください
    ...
  end
  # 休憩終了
  def rest_time_end
    ...
    # 実際のロジックを参照ください
    ...
  end
  ```

* app/views/home/index.html.erb

  休憩の開始・終了を追加しております
  内容は実際のファイルを参照ください
  各々ボタン押下で保存されるようになっています

* app/controllers/workers_controller.rb

  「テストプリント」ボタン押下で休憩が印字されるようにしております

  ```ruby
  ...
  # 以下を追加
  _rest_start_at = item.rest_start_at.present? ? I18n.l(item.rest_start_at, format: :xs) : nil
  _rest_end_at   = item.rest_end_at.present? ? I18n.l(item.rest_end_at, format: :xs) : nil
  ...
  rest_time1: "#{_rest_start_at}-#{_rest_end_at}",
  ...
  ```

  明細取得はテストプリントを印字するときのロジックです
  別例挙げておきます
  以下を参考にください

  ```ruby
  # line:81を参考に（ファイル上はコメントアウトしてあります）
  # 例:7月度（7月1日〜末日）の例を記載
  Array(current_user.attends.where(" ? <= start_at and start_at < ? ", Time.local(2018,7,1,0,0,0), Time.local(2018,8,1,0,0,0))).each.with_index(1) do |item, idx|
    ...
  end
  ```

* config/routes.rb

  以下を追加しております

  ```ruby
  resources :attends do
    ...
    get :rest_time_start
    get :rest_time_end
    ...
  end
  ```


- - -
# 2018.07.02
## ・Device新規登録にてbelong_toを利用して別モデルと共に登録を行おうとしておりますが、f.submitにてエラーが発生する]


  リダイレクト処理がありません。
  ```ruby
  redirect_to :controller => 'controller_name', :action => 'action_name'
  ```

## ・請求書のPDF（ThinReports）を作成したい。


　大まかには下記の手順で請求書PDF作成ができます。参考にしてください。

　①請求書レイアウトを専用のレポートデザイナ「Thinreports Editor」にて作成する。※動的に値を設定する箇所は変数名を付与（ex. billing_id）

　②1で作成したテンプレートファイルを/app/pdf/に配置する（ex. sample.tlf）

　③Controllerで値と設定する。

  ```ruby

　# TLFファイル読み込み
　report = ThinReports::Report.new :layout => "app/pdfs/order_pdf.tlf"

　# 1ページ目を開始
　report.start_new_page

  # 動的な値を設定する
  report.page.item(:billing_id).value(@billing.id)

  # ブラウザでPDFを表示する
  send_data report.generate,
          filename:    "#{@billing.id}.pdf",
          type:        "application/pdf",
          disposition: "inline"

  ```

## ・現在打刻の仕組みは作成完了しておりますが、Staff毎に打刻を出来るようにしたい。また連動するかとは存じますが、Staff毎に明細確認やシフト確認を出来るようにしたいです。
## ・ログインを行う前について、現在ヘッダーが表示されるのでうsが、ヘッダーを表示しないようにしたい

　画面の流れとしては以下の通りのイメージになるかと思われます。

　①indexページでログインしてセッションでユーザ情報を保持する。

　②現在のapplication.html.rbにリダイレクト（ご教示いただいたhttps://timecard.smaregi.jp/feature/attendance.phpのイメージ）

　参考：https://qiita.com/brainya/items/f2d8e9307206267d375f


## ・これはjavascriptも加わって来るのかと存じますが、時間が現在の日本時間と少しずれてしまっていますのでそれを修正したいです。


　実行環境のサーバ時刻のタイムゾーン設定が誤っている可能性があります。

　当方、仮想環境のCentOS上に環境作成しましたが、

　タイムゾーン設定を変更したら現在時刻が表示されるようになりました。


　①現在、変更後のタイムゾーンの確認

　$ date

　②タイムゾーンの変更

　$ sudo timedatectl set-timezone Asia/Tokyo
