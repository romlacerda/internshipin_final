class CreateUniversidades < ActiveRecord::Migration[5.1]
  def change
    create_table :universidades do |t|
      t.string :matricula
      t.string :nome
      t.string :sobrenome
      t.string :cpf

      t.timestamps
    end
  end
end
