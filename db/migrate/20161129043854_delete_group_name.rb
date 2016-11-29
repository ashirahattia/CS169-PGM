class DeleteGroupName < ActiveRecord::Migration
  def change
    remove_column :groups, :group_name
  end
end
