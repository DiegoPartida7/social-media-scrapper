class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :handler
      t.references :user, null: false, foreign_key: true
      t.string :last_post

      t.timestamps
    end
  end
end
