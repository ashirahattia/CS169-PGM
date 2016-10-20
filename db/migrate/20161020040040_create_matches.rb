class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :group_name
      t.string :project_name

      t.timestamps null: false
    end
  end
end
