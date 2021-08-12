class User < ActiveRecord::Base
    has_secure_password
    
    has_many :bats

    validates :username, presence: true, uniqueness: true, length: {minimum: 5}
    validates :email, presence: true, uniqueness: true, format: {with: URI::MailTo::EMAIL_REGEXP}
    validates :password, presence: true, length: {in: 6..20}
end