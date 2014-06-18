class CreateParagraphs < ActiveRecord::Migration
  def change
    create_table :paragraphs do |t|
      #t.belongs_to :appendable, polymorphic: true
      t.belongs_to :subheading
      t.text :content

      t.timestamps
    end
  end
end
