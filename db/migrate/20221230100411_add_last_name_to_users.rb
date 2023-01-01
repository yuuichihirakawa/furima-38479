class AddLastNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_name, :string
  end
  
  create_table :users do |t|
    t.string :last_name_kana,     null: false
    t.string :first_naem,         null: false
    t.string :first_name_kana,    null: false
    t.date :birth_date,           null: false
  end
end
