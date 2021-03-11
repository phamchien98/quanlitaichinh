class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.date :start_date
      t.date :end_date
      t.string :plan_money_come
      t.string :plan_money_out
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
