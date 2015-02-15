class VoucherRow < ActiveRecord::Base
  belongs_to :voucher
  validates :account_number, :presence => true
  validates :debit, :presence => true
  validates :credit, :presence => true
end
