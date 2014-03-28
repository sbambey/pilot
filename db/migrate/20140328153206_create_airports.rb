class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :website

      t.timestamps
    end
  end
end
