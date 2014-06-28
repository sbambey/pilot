class CreateFlies < ActiveRecord::Migration
  def change
    create_table :flies do |t|
    	t.belongs_to :airline
    	t.string :name
    	t.string :program_type
    	t.text :duration
    	t.text :post_graduation
    	t.string :website
      t.text :hiring_status
    	t.decimal :rating

      t.timestamps
    end
  end
end
