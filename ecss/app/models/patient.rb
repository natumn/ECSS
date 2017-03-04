class Patient < ApplicationRecord
  belongs_to :hosiptal
  has_one :family
end
