class AccountPlan < ActiveRecord::Base
  has_many :accounts
  validates :name, :presence => true
  accepts_nested_attributes_for :accounts
end
