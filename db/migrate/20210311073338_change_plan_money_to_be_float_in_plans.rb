class ChangePlanMoneyToBeFloatInPlans < ActiveRecord::Migration[6.1]
  def change
  	change_column :plans, :plan_money_come, :float
  	change_column :plans, :plan_money_out, :float
  end
end
