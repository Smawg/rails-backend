class BusinessYear < ActiveRecord::Base
  has_many :vouchers
  has_one :accountplan
end
