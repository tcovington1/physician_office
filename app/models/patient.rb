class Patient < ApplicationRecord
  validates :name, :age, presence: true
  has_many :appointments
  has_many :physicians, :through => :appointments
end
