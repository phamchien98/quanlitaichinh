class AddTimeToReceipts < ActiveRecord::Migration[6.1]
  def change
    add_column :receipts, :time, :date
  end
end
