class Group < ActiveRecord::Base
    has_one :match, dependent: :destroy
    belongs_to :force_matched_project, class_name: "Project", inverse_of: :force_matched_group, foreign_key: "force_matched_project_id"
end
