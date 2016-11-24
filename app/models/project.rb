class Project < ActiveRecord::Base
    has_one :match, dependent: :destroy
end
