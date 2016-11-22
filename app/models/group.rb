class Group < ActiveRecord::Base
    has_one :match, dependent: :destroy
end
