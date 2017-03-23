class Question < ApplicationRecord
  belongs_to :quiz
  has_many :answers, inverse_of: :question
  accepts_nested_attributes_for :answers
end
