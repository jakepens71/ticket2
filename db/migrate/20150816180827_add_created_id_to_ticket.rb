class AddCreatedIdToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :created_id, :integer
  end
end
