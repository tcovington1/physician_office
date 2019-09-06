class Physician < ApplicationRecord
  validates :name, :specialty, presence: true
  has_many :appointments
  has_many :patients, through: :appointments
end
