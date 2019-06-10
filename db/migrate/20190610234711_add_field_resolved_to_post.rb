class AddFieldResolvedToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :resolved, :boolean, default: false
  end
end
