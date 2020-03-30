require 'pry'

class Post < ActiveRecord::Base
    validates :title, presence: :true 
    validates :content, length: { minimum: 50 }
    validates :summary, length: { maximum: 50 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
    validate :clickbait 

    def clickbait 
        clickbait_tags = [/Won't Believe/, /Secret/, /Top [0-9]*/, /Guess/]
        if clickbait_tags.none? { |reg| reg.match title }
            errors.add(:title, "is not clickbait")
        end 
    end 
end
