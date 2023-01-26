class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :questions

  validates :head, presence: true, on: :update
  validates :name, presence: true, on: :update
  validates :link, presence: true, on: :update
  validates :address, presence: true, on: :update
  validates :content, presence: true, on: :update
  validates :schedule, presence: true, on: :update
  validates :wage, presence: true, on: :update
  validates :vacation, presence: true, on: :update
  validates :employment, presence: true, on: :update
  validates :welfare, presence: true, on: :update
end
