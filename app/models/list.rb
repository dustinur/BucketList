class List < ApplicationRecord
  has_one :destinations
  has_many :activities
end
