class AddDescriptionToPackage < ActiveRecord::Migration
  def change
    add_column :packages, :description, :string
  end
end
