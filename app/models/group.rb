class Group < ActiveRecord::Base
    attr_accessor :first_choice
    attr_accessor :second_choice
    attr_accessor :third_choice
    attr_accessor :fourth_choice
    attr_accessor :fifth_choice
    attr_accessor :sixth_choice
    attr_accessor :seventh_choice
    attr_accessor :group_name
    
    def initialize
        # Set choices based on Google Form
    end
    
end
