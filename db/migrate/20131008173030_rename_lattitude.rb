class RenameLattitude < ActiveRecord::Migration
  def change
    rename_column :locations, :lattitude, :latitude
  end
end
