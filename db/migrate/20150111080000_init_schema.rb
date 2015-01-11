class InitSchema < ActiveRecord::Migration

  def up
    create_table :users do |t|
      t.string :name

      t.timestamps
    end

    create_table :business_years do |t|
      t.integer :year
      t.datetime :year_start
      t.datetime :year_end

      t.integer :accountplan_id

      t.timestamps
    end

    create_table :account_plans do |t|
      t.string :name
      t.string :description

      t.timestamps
    end

    create_table :accounts do |t|
      t.integer :number
      t.string :name
      t.string :description

      t.integer :account_plan_id

      t.timestamps
    end

    create_table :vouchers do |t|
      t.integer :number
      t.string :description
      t.datetime :date

      t.integer :businessyear_id

      t.timestamps
    end

    create_table :voucher_rows do |t|
      t.integer :account_number
      t.float :debet
      t.float :credit

      t.integer :voucher_id

      #t.timestamps
    end

  end

  def down
    raise "Cannot revert initial migration"
  end
end

