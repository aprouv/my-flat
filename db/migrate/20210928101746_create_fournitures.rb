class CreateFournitures < ActiveRecord::Migration[6.0]
  def change
    create_table :fournitures do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
