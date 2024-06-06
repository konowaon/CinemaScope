class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.text :cast
      t.text :synopsis
      t.date :release_date
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end