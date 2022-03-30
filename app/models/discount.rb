class Discount < ApplicationRecord
  belongs_to :user
  enum status: [:active, :inactive]
  enum kind: [:porcent, :money]
  validates :nome, :value, :kind, :status, presence: true
end
