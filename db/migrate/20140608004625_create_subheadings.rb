class CreateSubheadings < ActiveRecord::Migration
  def change
    create_table :subheadings do |t|
    	#t.belongs_to :appendable, polymorphic: true
    	t.belongs_to :heading
      t.text :title

      t.timestamps
    end
  end
end
