class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :stars
      t.text :review
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
