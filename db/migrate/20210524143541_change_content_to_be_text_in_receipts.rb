class ChangeContentToBeTextInReceipts < ActiveRecord::Migration[6.1]
  def change
    change_column :receipts, :content, :text
  end
end
