class CreateManagements < ActiveRecord::Migration[5.1]
  def change
    create_table :managements do |t|
      t.string :company
      t.string :company_short
      t.string :first_name
      t.string :last_name
      t.string :first_kana
      t.string :last_kana
      t.string :tel
      t.string :fax
      t.string :e_mail
      t.string :postnumber
      t.string :address
      t.string :capital
      t.string :labor_number
      t.string :employment_number

      t.timestamps
    end
  end
end
