class CreateInternetProtocols < ActiveRecord::Migration[6.0]
  def change
    create_table :internet_protocols do |t|
      t.references :token_url, index: true
      t.string :address, null: false

      t.timestamps null: false
    end
  end
end
