class AddSobrenomeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :sobrenome, :string
  end
end
