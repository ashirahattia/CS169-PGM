class MatchForeignKeys < ActiveRecord::Migration
  def change
    remove_column :matches, :group_name, :string
    remove_column :matches, :project_name, :string
    add_reference :matches, :group, index: true
    add_reference :matches, :project, index: true
  end
end
