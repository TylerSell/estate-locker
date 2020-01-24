class RenameTypeColumnPlansTable < ActiveRecord::Migration
  def change
    rename_column :plans, :type, :kind_of_plan
  end
end
