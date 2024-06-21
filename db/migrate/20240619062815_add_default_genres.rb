class AddDefaultGenres < ActiveRecord::Migration[6.1]
  def change
    reversible do |dir|
      dir.up do
        genres = ['アクション映画', 'アニメーション映画', 'コメディ映画', 'ファンタジー映画', 'ホラー映画', 'ミステリー映画', 'ロマンス映画']
        genres.each do |genre|
          Genre.create(name: genre)
        end
      end
    end
  end
end
