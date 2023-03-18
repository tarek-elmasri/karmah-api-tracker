class AddUniqueIndexToUserAccounts < ActiveRecord::Migration[7.0]
  def change
    add_index :user_accounts, [:user_id, :account_id], unique: true
  end
end
