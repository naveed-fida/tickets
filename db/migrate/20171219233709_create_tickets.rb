class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :name
      t.text :body
      t.string :status
      t.references :project
      t.timestamps
    end
  end
end
