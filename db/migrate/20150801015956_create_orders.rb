class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :recipient
      t.string :address
      t.string :tel
      t.string :email
      t.text :note

      t.timestamps null: false
    end
  end
end
