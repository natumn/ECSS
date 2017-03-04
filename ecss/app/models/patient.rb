class Patient < ApplicationRecord
  belongs_to :hospital
  has_one :family
end
