class CreateDemoRailsEngineOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :demo_rails_engine_orders do |t|
      t.string :number
      t.string :status
      t.decimal :total_price

      t.timestamps
    end
    add_index :demo_rails_engine_orders, :total_price
  end
end
