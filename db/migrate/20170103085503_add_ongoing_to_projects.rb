class AddOngoingToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :ongoing, :boolean, default: true
    add_index :projects, :ongoing
  end
end
