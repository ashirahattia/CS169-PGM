require "spec_helper"

describe MatchesHelper, :type => :helper do
    it 'returns the project preference number' do
      fake_projects = []
      for project_index in 1..8
        fake_proj_name = ("Project" + project_index)
        fake_proj = Project.new(:project_name => fake_proj_name, :id => project_index)
        allow(Project).to receive(:find_by).with(:project_name => fake_proj_name) { fake_proj }
        fake_projects.push(fake_proj)
      end
        
        fake_group1 = Group.new(:group_name => "Group1", :id => 1, :first_choice => 1, :second_choice => 2, :third_choice => 3, :fourth_choice => 4, :fifth_choice => 5, :sixth_choice => 6, :seventh_choice => 7)
        
        allow(Group).to receive(:where).with(:group_name => "Group1") { [fake_group1] }

      fake_matches = []
      for match_index in 1..8
        fake_match_proj = ("Project" + match_index)
        fake_match = Match.new(:project_name => fake_match_proj, :group_name => "Group1")
        fake_matches.push(fake_match)
      end

      for match in 1..8
        helper.choice_num(fake_matches[match-1]).should eql(match)
      end

    end
end