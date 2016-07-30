class CreateSicknesses < ActiveRecord::Migration
  def change
    create_table :sicknesses do |t|
      t.string :title
      t.string :short_description
      t.string :img_url
      t.string :url

      t.timestamps null: false
    end
  end
end
