class CreateBusinessYears < ActiveRecord::Migration
  def change
    create_table :business_years do |t|
      t.integer :year
      t.datetime :year_start
      t.datetime :year_end

      t.timestamps
    end
  end
end
