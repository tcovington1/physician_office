class Appointment < ApplicationRecord
  belongs_to :physician, dependent: :destroy
  belongs_to :patient, dependent: :destroy
end
