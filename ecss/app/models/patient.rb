class Patient < ApplicationRecord
  belongs_to :hospital
  has_one :family

  validates :name, presence: true
  validates :tel, presence: true
  validates :mail, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
  validates :disease, presence: true

  def age
    date_format = "%Y%m%d"
    if birthday.present?
      (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
    else
      nil
    end
  end

end
