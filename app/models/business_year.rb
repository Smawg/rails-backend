class BusinessYear < ActiveRecord::Base
  has_many :vouchers
  has_one :accountplan

  def self.findByYear(org, year)
    find_by(organisation_id: org, year: year)
  end
end
