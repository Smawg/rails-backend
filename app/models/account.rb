class Account < ActiveRecord::Base
  belongs_to :accountplan
#  validates :number, :prescence => true
end
