class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |table|
      table.string :type
      table.string :company
      table.string :account_number
      table.string :contact_number
      table.string :beneficiary
      table.string :notes
      table.integer :family_member_id
      table.integer :user_id
  end
end
