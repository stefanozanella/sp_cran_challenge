class Package < ActiveRecord::Base
  alias_attribute :Package, :name
  alias_attribute :Version, :version
  alias_attribute :Title, :title
end
