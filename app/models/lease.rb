class Lease < ApplicationRecord
    belongs_to :apartment
    belongs_to :tenant
    validates :rent, :apartment_id, :tenant_id, presence: true
    validates :rent, :apartment_id, :tenant_id, numericality: { only_integer: true }
end
