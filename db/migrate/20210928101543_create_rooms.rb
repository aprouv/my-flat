class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.string :banner_url

      t.timestamps
    end
  end
end
