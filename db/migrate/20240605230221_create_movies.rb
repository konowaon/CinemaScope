class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.text :description
      t.decimal :rating, precision: 3, scale: 1
      t.text :cast
      t.text :synopsis
      t.date :release_date
      t.references :genre, null: false, foreign_key: true


      t.timestamps
    end
  end
end
