class Activity < ApplicationRecord
  belongs_to :user

  validates_presence_of :kind, :amount
end
