class CreateReceipts < ActiveRecord::Migration[6.1]
  def change
    create_table :receipts do |t|
      t.string :image
      t.string :content
      t.float :total_money
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
