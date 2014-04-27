class AddMedicalRequirementsToOpportunity < ActiveRecord::Migration
  def change
    add_column :opportunities, :medical_requirements, :text
  end
end
