class CreateSubheadings < ActiveRecord::Migration
  def change
    create_table :subheadings do |t|
      t.string :title
      t.integer :heading_id

      t.timestamps
    end
  end
end
