class CreateOpportunities < ActiveRecord::Migration
  def change
    create_table :opportunities do |t|
    	t.string :name
    	t.string :company
    	t.string :logo
    	t.string :program_type
    	t.text :duration
    	t.text :post_graduation
    	t.string :website
    	t.decimal :rating

      t.timestamps
    end
  end
end
