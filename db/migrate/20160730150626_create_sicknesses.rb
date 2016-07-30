class CreateSicknesses < ActiveRecord::Migration
  def change
    create_table :sicknesses do |t|

      t.timestamps null: false
    end
  end
end
