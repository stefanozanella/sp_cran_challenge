require "test_helper"

module CranCrawler
  module Test
    describe Archiver do
      let(:archiver) { Archiver.new }
      let(:package) { {
        "Package" => "abc",
        "Version" => "1.2.3",
        "authors" => [
          { "name" => "Author 1" },
          { "name" => "Author 2" },
        ]
      } }

      it "saves the relationship automatically" do
        archiver = Archiver.new
        archiver.store(package)

        Package.first.authors.length.must_equal 2
      end
    end
  end
end
