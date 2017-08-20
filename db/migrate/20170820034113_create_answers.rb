class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.text :descricao, null: false
      t.references :user, foreign_key: true, null: false
      t.references :topic, foreign_key: true, null: false

      t.timestamps
    end
  end
end
