class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :overview
      t.string :image
      t.string :backdrop
      t.integer :alt_id
      t.string :video
      t.string :category

      t.timestamps
    end
  end
end
