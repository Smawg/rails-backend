class Account < ActiveRecord::Base
  belongs_to :accountplan
#  validates :number, :prescence => true

  def self.findByNumber(plan_id, number)
    find_by(account_plan_id: plan_id, number: number)
  end
end
