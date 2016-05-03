class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.text :content
      t.string :state
      t.datetime :archived_at
      t.datetime :read_at

      t.timestamps null: false
    end
  end
end
