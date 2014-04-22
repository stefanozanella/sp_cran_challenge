class Package < ActiveRecord::Base
  alias_attribute :Package, :name
  alias_attribute :Version, :version
  alias_attribute :Title, :title

  has_and_belongs_to_many :authors, :autosave => true

  accepts_nested_attributes_for :authors
end
