class Plan < ActiveRecord::Base
    belongs_to :family_member
    belongs_to :user
end