class CreateTagsTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tags_tickets do |t|
      t.references :tag
      t.references :ticket
    end
  end
end
