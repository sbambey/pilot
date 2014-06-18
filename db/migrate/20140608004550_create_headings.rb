class CreateHeadings < ActiveRecord::Migration
  def change
    create_table :headings do |t|
    	t.belongs_to :opportunity
      t.text :title
      t.boolean :is_table

      t.timestamps
    end
  end
end
