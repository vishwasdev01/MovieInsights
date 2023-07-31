class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.text :description
      t.integer :year
      t.string :director
      t.integer :country_id

      t.timestamps
    end
  end
end
