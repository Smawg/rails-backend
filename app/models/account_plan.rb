class AccountPlan < ActiveRecord::Base
  has_many :accounts
#  validates :name, :presence => true
  accepts_nested_attributes_for :accounts
  belongs_to :organisation

  def self.findByName(org, name)
    find_by(organisation_id: org, name: name)
  end
end
