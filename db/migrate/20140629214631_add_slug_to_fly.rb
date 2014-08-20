class AddSlugToFly < ActiveRecord::Migration
  def change
    add_column :flies, :slug, :string
    add_index :flies, :slug
  end
end
