class AddActiveToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :active, :boolean
  end
end
