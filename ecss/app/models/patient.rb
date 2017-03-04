class Patient < ApplicationRecord
  belongs_to :hospital
  has_one :family

  validates :name, presence: true
  validates :tel, presence: true
  validates :mail, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
  validates :disease, presence: true
end
