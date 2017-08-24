class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.integer :max_users
      t.string :titulo
      t.text :descricao
      t.string :prazo
      t.decimal :total_hours
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
