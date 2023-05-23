class CreateTinyUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :tiny_urls do |t|
      t.string :url
      t.string :short_url
      t.integer :clicked, default: 0

      t.timestamps
    end
  end
end
