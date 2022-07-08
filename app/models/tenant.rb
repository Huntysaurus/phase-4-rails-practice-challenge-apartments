class Tenant < ApplicationRecord
    has_many :leases, dependent: :destroy
    has_many :apartments, through: :leases
    validates :name, :age, presence: true
    validates :age, numericality: { only_integer: true}
    validates :age, numericality: { greater_than_or_equal_to: 18 }
end
