class CreateFamilyMembers < ActiveRecord::Migration[6.0]
  def up
    create_table :family_members do |t|
      t.string :first_name
      t.string :last_name
      t.string :date_of_birth
      t.string :user_id
    end
  end
  
  def down
    drop_table :family_members 
  end
end
