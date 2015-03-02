class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :reviewable, polymorphic: true, index: true
      t.text :content
      t.references :user, index: true

      t.timestamps
    end
  end
end
