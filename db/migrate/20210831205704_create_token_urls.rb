class CreateTokenUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :token_urls do |t|
      t.string :url, null: false, unique: true
      t.string :token, null: false, unique: true

      t.timestamps null: false
    end
  end
end
