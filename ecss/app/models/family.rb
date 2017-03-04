class Family < ApplicationRecord
  belongs_to :patient

  validates :name, presence: true
  validates :tel, presence: true
  validates :mail, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
  validates :disease, presence: true

end
