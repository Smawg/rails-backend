class Organisation < ActiveRecord::Base
  has_many :business_years
  has_many :account_plans
  validates :name, :presence => true, uniqueness: true
end
