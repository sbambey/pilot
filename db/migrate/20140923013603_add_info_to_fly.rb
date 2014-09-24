class AddInfoToFly < ActiveRecord::Migration
  def change
    add_column :flies, :location, :string
    add_column :flies, :posting_date, :datetime
    add_column :flies, :expiration_date, :string
  end
end
