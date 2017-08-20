class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :titulo
      t.text :descricao
      t.references :user, foreign_key: true
      t.integer :status
      t.integer :tipo
      t.references :category, foreign_key: true
      t.references :subcategory, foreign_key: true

      t.timestamps
    end
  end
end
