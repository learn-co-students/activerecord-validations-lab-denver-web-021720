class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}
  validate :custom_validator

    def custom_validator
        clickable_phrases = [/Won\'t Believe/, /Secret/, /Top [0-9]+/, /Guess/]

        errors.add(:title, "blah blah blah") unless 
        clickable_phrases.map {|phrase| phrase.match?(title)}.include?(true)
    end
end
