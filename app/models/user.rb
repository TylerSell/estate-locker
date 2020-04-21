class User < ActiveRecord::Base
    has_secure_password
    has_many :family_members
    has_many :plans, through: :family_members
    validates :username, :password, presence: true 
    validates :username, uniqueness: { case_sensitive: false } 
end