class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :family_members do |table|
      table.string :first_name
      table.string :last_name
      table.string :date_of_birth
      table.integer :user_id
  end
end