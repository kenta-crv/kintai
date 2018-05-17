class CreateRules < ActiveRecord::Migration[5.1]
  def change
    create_table :rules do |t|
      # t.string :try #試用期間
      # t.string :work_start #勤務開始時間
      # t.string :break_in #休憩開始時間
      # t.string :break_out #休憩終了時間
      # t.string :work_out #勤務終了時間

      t.integer :management_id # 追加：managementsテーブルと紐付け
      t.integer :user_id # 追加：usersテーブルと紐付け

      t.date :trial_period_start_on #試用期間
      t.date :trial_period_end_on #試用期間
      t.integer :work_start #勤務開始時間
      t.integer :break_in #休憩開始時間
      t.integer :break_out #休憩終了時間
      t.integer :work_out #勤務終了時間
      t.string :holiday #休日
      t.string :allowance #手当
      t.string :allowance_contents #手当詳細
      # t.string :closing_date #給料締め日
      # t.string :payment_date #給料支払い日
      t.date :closing_on #給料締め日
      t.date :payment_on #給料支払い日
      t.string :desuction #控除

      t.timestamps
    end
  end
end
