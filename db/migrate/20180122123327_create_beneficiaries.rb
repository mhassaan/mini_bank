class CreateBeneficiaries < ActiveRecord::Migration[5.1]
  def change
    create_table :beneficiaries do |t|
      t.integer :user_id
      t.integer :account_id
      t.integer :benefactor_id
      t.timestamps
    end
  end
end
