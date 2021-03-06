class User < ActiveRecord::Base
    has_secure_password
    
    has_many :bats

    validates :username, presence: true, uniqueness: true, length: {minimum: 5}
    validates :email, presence: true, uniqueness: true, format: {with: URI::MailTo::EMAIL_REGEXP}
    # /\A[a-zA-Z0-9.!\#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\z/
    validates :password, length: {in: 6..20}

    def slug
        username.downcase.gsub(" ", "-")
    end

    def self.find_by_slug(slug)
        User.all.find{|user| user.slug == slug}
    end
end