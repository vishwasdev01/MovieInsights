class CreateFilmingLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :filming_locations do |t|
      t.string :name
      t.references :country
      t.timestamps
    end
  end
end
