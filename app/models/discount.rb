class Discount < ApplicationRecord
  belongs_to :user
  belongs_to :sales
  enum status: [:active, :inactive]
  enum kind: [:porcent, :money]
  validates :nome, :value, :kind, :status, presence: true
end
