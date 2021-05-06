class AddUserToReceipts < ActiveRecord::Migration[6.1]
  def change
    add_reference :receipts, :user, null: false, foreign_key: true
  end
end
