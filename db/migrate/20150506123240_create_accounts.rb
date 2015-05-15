class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :title
      t.integer :expense
      t.datetime :datetime

      t.timestamps null: false
    end
  end
end
