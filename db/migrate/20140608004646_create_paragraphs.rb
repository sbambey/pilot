class CreateParagraphs < ActiveRecord::Migration
  def change
    create_table :paragraphs do |t|
      t.string :content
      t.integer :subheading_id

      t.timestamps
    end
  end
end
