class Project < ActiveRecord::Base
    has_one :match, dependent: :destroy
    has_one :force_matched_group, class_name: "Group", dependent: :nullify, inverse_of: :force_matched_project, foreign_key: "force_matched_project_id"
end
