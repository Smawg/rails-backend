class CreateVouchers < ActiveRecord::Migration
  def change
    create_table :vouchers do |t|
      t.integer :number
      t.string :description
      t.datetime :date

      t.timestamps
    end
  end
end
