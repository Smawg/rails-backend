class Organisation < ActiveRecord::Base
  has_many :business_years
  has_many :account_plans
  validates :name, :presence => true, uniqueness: true

  def self.findByName(name)
    find_by(name: name)
  end
end
