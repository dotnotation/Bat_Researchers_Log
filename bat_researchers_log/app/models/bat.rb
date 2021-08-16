class Bat < ActiveRecord::Base
    belongs_to :user

    validates :identification, presence: true, uniqueness: true

    # def bat_slug
    #     identification.downcase.gsub(" ", "-")
    # end

    # def self.find_by_bat_slug(bat_slug)
    #     Bat.all.find{|bat| bat.bat_slug == bat_slug}
    # end
end