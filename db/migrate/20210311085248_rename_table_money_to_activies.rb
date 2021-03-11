class RenameTableMoneyToActivies < ActiveRecord::Migration[6.1]
  def change
  	rename_table :money, :activities
  end
end
