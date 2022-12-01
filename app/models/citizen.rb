class Citizen < ApplicationRecord
    validates :first_name, :last_name, :cpf, :cns, :email, :birthday, :phone, :status, presence: true
    has_one :citizen_address
    accepts_nested_attributes_for :citizen_address
    
    
end
