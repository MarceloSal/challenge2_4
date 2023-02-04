class CitizenAddress < ApplicationRecord
  validates :zip_code, :public_place, :district, :city,  presence: true
  
  belongs_to :citizen
end
