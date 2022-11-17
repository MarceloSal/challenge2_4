class Citizen < ApplicationRecord
    validates :first_name, :last_name, :cpf, :cns, :email, :birthday, :phone, :status, presence: true
end
