class AddGeneralInformationToOpportunity < ActiveRecord::Migration
  def change
    add_column :opportunities, :general_information, :text
  end
end
