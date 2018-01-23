class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :title
      t.float :balance, default: 0

      t.timestamps
    end
  end
end
