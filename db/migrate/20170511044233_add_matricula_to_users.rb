class AddMatriculaToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :matricula, :string, null:false, default: 0
  end
end
