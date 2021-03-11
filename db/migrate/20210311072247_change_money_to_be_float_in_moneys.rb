class ChangeMoneyToBeFloatInMoneys < ActiveRecord::Migration[6.1]
  def change
  	change_column :money, :money, :float
  end
end
