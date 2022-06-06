class CreateVelos < ActiveRecord::Migration[7.0]
  def change
    create_table :velos do |t|
      t.string :name
      t.string :company
      t.string :city
      t.string :country
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end


end
