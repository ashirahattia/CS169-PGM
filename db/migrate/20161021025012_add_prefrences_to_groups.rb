class AddPrefrencesToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :first_choice, :integer
    add_column :groups, :second_choice, :integer
    add_column :groups, :third_choice, :integer
  end
end
