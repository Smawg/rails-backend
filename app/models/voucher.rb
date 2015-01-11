class Voucher < ActiveRecord::Base
  has_many :voucher_rows
  belongs_to :businessyears
  validates :number, :presence => true
  validates :date, :presence => true
  accepts_nested_attributes_for :voucher_rows
end
