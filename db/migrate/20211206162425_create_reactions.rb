class CreateReactions < ActiveRecord::Migration[6.1]
  def change
    create_table :reactions do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :post, null: false, foreign_key: true
      t.boolean :like
      t.boolean :clap
      t.boolean :love
      t.boolean :dislike
      

      t.timestamps
    end
  end
end
