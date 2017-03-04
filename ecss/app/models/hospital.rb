class Hospital < ApplicationRecord
  has_many :patients

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, confirmation: { :if => :validate_password? }
  validates :tel, presence: true
  validates :mail, presence: true
  validates :postcode, presence: true
  validates :address, presence: true

end
