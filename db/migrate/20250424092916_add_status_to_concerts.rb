class AddStatusToConcerts < ActiveRecord::Migration[6.1]
  def change
    add_column :concerts, :status, :string
  end
end
