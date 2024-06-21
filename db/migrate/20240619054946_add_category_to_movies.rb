class AddCategoryToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :category, :string
  end
end
