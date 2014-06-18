class CreateOpportunities < ActiveRecord::Migration
  def change
    create_table :opportunities do |t|
      t.belongs_to :airline
    	t.string :opportunity_name
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