class Discount < ApplicationRecord
  belongs_to :user
  belongs_to :sales
  enum status: [:active, :inactive]
  enum kind: [:porcent, :money]
  validates :name, :value, :kind, :status, presence: true
end
