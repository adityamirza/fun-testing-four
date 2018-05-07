class Scenario < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :steps
  has_and_belongs_to_many :features
end
