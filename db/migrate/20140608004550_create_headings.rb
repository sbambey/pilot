class CreateHeadings < ActiveRecord::Migration
  def change
    create_table :headings do |t|
      t.string :title
      t.integer :opportunity_id

      t.timestamps
    end
  end
end
