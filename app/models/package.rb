class Package < ActiveRecord::Base
  alias_attribute :Package, :name
  alias_attribute :Version, :version
end
