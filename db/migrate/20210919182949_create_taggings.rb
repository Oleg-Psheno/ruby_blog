class CreateTaggings < ActiveRecord::Migration[6.1]
  def change
    create_table :taggings do |t|
      t.belongs_to :post, null: false, foreign_key: true
      t.belongs_to :tag

      t.timestamps
    end
  end
end
