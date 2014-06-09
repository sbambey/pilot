class CreateAirlines < ActiveRecord::Migration
  def change
    create_table :airlines do |t|
      t.belongs_to :opportunity
      t.string :airline_name
      t.string :logo

      t.timestamps
    end
  end
end