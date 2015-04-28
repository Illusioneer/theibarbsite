class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.json :title
      t.json :content
      t.json :metadata

      t.timestamps null: false
    end
  end
end
