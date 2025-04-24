class AddSetlistToConcerts < ActiveRecord::Migration[6.1]
  def change
    add_column :concerts, :setlist, :text
  end
end
