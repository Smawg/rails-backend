class CreateAccountPlans < ActiveRecord::Migration
  def change
    create_table :account_plans do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
