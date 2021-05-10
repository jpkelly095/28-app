class Patient < ApplicationRecord
  belongs_to :state
  has_one :prescription
end
