class Physician < ApplicationRecord
  validates :name, :specialty, presence: true
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
end
