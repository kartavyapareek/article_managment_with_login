class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.integer :status
      t.references :user

      t.timestamps
    end
  end
end
