class Bat < ActiveRecord::Base
    belongs_to :user

    validates :identification, presence: true, uniqueness: true
end