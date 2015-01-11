class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :number
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
