require 'test_helper'

module CranCrawler
  module Test
    describe URLFetcher do
      describe "#fetch_package" do
        it "fetches the tarball for a package from the CRAN website" do
          raw_pkg = URLFetcher.new.fetch_package({"Package" => "A3", "Version" => "0.9.2"})
          raw_pkg.wont_be_empty
        end
      end
    end
  end
end
