class AddFourFiveSixSeventhChoices < ActiveRecord::Migration
  def change
    add_column :groups, :fourth_choice, :integer
    add_column :groups, :fifth_choice, :integer
    add_column :groups, :sixth_choice, :integer
    add_column :groups, :seventh_choice, :integer
  end
end
