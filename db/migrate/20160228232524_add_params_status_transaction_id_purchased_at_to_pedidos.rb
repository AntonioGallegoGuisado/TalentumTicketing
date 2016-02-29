class AddParamsStatusTransactionIdPurchasedAtToPedidos < ActiveRecord::Migration
  def change
    add_column :pedidos, :notification_params, :text
    add_column :pedidos, :status, :string
    add_column :pedidos, :transaction_id, :string
    add_column :pedidos, :purchased_at, :datetime
  end
end
