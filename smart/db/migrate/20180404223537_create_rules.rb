class CreateRules < ActiveRecord::Migration[5.1]
  def change
    create_table :rules do |t|
      t.string :try #試用期間
      t.string :work_start #勤務開始時間
      t.string :break_in #休憩開始時間
      t.string :break_out #休憩終了時間
      t.string :work_out #勤務終了時間
      t.string :holiday #休日
      t.string :allowance #手当
      t.string :allowance_contents #手当詳細
      t.string :closing_date #給料締め日
      t.string :payment_date #給料支払い日
      t.string :desuction #控除

      t.timestamps
    end
  end
end
