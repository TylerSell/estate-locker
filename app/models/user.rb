class User < ActiveRecord::Base
    has_secure_password
    has_many :family_members
    has_many :plans, through: :family_members
end