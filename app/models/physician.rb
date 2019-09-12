class Physician < ApplicationRecord
  validates :name, :specialty, presence: true
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments

  def self.by_id
    order(:physician.id)
  end
end
