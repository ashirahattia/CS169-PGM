class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.text :spreadsheet_id
      t.text :group_tab
      t.text :group_username_col
      t.text :group_id_col
      t.text :group_preference_1
      t.text :group_preference_2
      t.text :group_preference_3
      t.text :group_preference_4
      t.text :group_preference_5
      t.text :group_preference_6
      t.text :group_preference_7
      t.text :project_tab
      t.text :project_id_col
      t.text :project_name_col
      t.text :matches_tab
      t.timestamps null: false
    end
  end
end
