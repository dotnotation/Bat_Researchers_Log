class Bat < ActiveRecord::Base
    belongs_to :user

    validates :identification, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
end