class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :type
      t.string :company
      t.string :account_number
      t.string :contact_number
      t.string :beneficiary
      t.string :notes
      t.integer :family_member_id
      t.integer :user_id
    end
  end
end
