class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :sender_account_id
      t.integer :reciever_account_id
      t.integer :reciever_user_id
      t.string :status
      t.float :amount
      t.integer :user_id

      t.timestamps
    end
  end
end
