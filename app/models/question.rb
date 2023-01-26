class Question < ApplicationRecord
  belongs_to :company

  validates :title, presence: true
  validates :question_content, presence: true
end
