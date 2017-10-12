class Question < ApplicationRecord
  enum question_type: %i(single_choice multiple_choice)

  belongs_to :chapter

  has_many :answers, dependent: :destroy
  has_many :results, dependent: :destroy
end
