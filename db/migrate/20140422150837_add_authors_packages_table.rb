class AddAuthorsPackagesTable < ActiveRecord::Migration
  def change
    create_join_table :authors, :packages
  end
end
