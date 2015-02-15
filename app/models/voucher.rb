class Voucher < ActiveRecord::Base
  has_many :voucher_rows
  belongs_to :businessyears
  validates :number, :presence => true
  validates :date, :presence => true
  accepts_nested_attributes_for :voucher_rows

  def self.findByNumber(year_id, number)
    find_by(business_year_id: year_id, number: number)
  end
end
