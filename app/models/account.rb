class Account < ApplicationRecord

  belongs_to :user
  scope :is_active, -> {where(active: true)}
end
