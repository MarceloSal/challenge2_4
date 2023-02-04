class Citizen < ApplicationRecord
    validates :cpf, :cns,:birthday, :phone, presence: true
    validates :first_name, length: {minimum: 4}
    validates :last_name, length: {minimum: 4}
    before_save { self.email = email.downcase }
    validates :email, presence: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create}, uniqueness: {case_sensitive: false}
    has_one :citizen_address
    accepts_nested_attributes_for :citizen_address
    
    
end
