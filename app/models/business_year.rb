class BusinessYear < ActiveRecord::Base
  has_many: :vouchers
end
