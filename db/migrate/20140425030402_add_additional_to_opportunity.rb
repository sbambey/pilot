class AddAdditionalToOpportunity < ActiveRecord::Migration
  def change
    add_column :opportunities, :additional, :text
  end
end
