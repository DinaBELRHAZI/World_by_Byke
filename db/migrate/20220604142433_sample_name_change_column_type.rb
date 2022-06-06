class SampleNameChangeColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column(:velos, :latitude, :float)
    change_column(:velos, :longitude, :float)
  end
  def up
    change_column :velos, :latitude, :float
    change_column :velos, :longitude, :float
  end

  def down
    change_column :velos, :latitude, :integer
    change_column :velos, :longitude, :integer
  end
end
