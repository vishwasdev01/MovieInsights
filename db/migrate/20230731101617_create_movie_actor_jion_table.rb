class CreateMovieActorJionTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :movies, :actors
  end
end
