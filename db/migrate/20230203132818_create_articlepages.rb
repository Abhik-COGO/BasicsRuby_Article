class CreateArticlepages < ActiveRecord::Migration[7.0]
  def change
    create_table :articlepages do |t|
      t.string :author
      t.date :createdOn
      t.string :category
      t.text :body
      t.integer :page
      t.timestamps
    end
  end
end
