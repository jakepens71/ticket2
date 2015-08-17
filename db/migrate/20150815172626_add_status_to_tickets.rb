class AddStatusToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :status, :boolean, :default => false
  end
end
