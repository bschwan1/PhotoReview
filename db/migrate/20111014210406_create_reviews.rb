class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :reviewer
      t.text :body
      t.references :photo

      t.timestamps
    end
    add_index :reviews, :photo_id
  end
end
