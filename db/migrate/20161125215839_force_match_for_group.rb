class ForceMatchForGroup < ActiveRecord::Migration
  def change
    add_column :groups, :force_matched_project_id, :integer
  end
end
