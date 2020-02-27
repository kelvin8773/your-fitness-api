class User < ApplicationRecord
  has_many :activities, dependent: :destroy

  #validations
  validates_presence_of :name, :age, :sex
end
