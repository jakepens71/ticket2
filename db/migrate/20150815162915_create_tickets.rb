class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.string :body
      t.integer :level
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
