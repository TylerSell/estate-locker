class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |table|
      table.string :first_name
      table.string :last_name
      table.string :username
      table.string :password_digest
  end
end
