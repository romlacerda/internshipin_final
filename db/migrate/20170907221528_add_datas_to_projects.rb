class AddDatasToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :datainicio, :datetime
    add_column :projects, :datafim, :datetime
  end
end
