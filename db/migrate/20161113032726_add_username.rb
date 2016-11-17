class AddUsername < ActiveRecord::Migration
  def change
    add_column :groups, :username, :string
  end
end
