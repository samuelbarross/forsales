class Client < ApplicationRecord
  belongs_to :user
  enum status: [:active, :inactive]

  validates :name, :email, :status, presence: true
end
