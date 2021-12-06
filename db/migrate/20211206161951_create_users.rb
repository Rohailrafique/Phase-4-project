class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :display_name
      t.string :password_digest
      t.string :image_url
      t.string :twitter_url
      t.string :facebook_url
      t.string :linkedin_url

      t.timestamps
    end
  end
end
