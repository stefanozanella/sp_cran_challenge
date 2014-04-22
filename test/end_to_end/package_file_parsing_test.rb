require 'test_helper'

module CranCrawler
  module Test
    describe "crawling the list of packages from CRAN" do
      describe "task `crawl`" do
        let(:first_package_name) { package_list.first["Package"] }
        let(:package_count) { package_list.length }
        let(:url_fetcher) { stub }
        let(:tarball_parser) { stub }
    
        before :each do
          url_fetcher.stubs(:fetch_package).returns("")
          tarball_parser.stubs(:extract_info).returns({})

          Package.delete_all
        end
    
        it "stores the names of the packages" do
          # `rake crawl` # I'd like to run this, but I'm gonna have problems with
          # the package downloading part
          Spider.new(PackageParser.new, Archiver.new, tarball_parser, url_fetcher).crawl
          Package.first.name.must_equal first_package_name
        end
    
        it "saves all packages" do
          # `rake crawl` # I'd like to run this, but I'm gonna have problems with
          # the package downloading part
          Spider.new(PackageParser.new, Archiver.new, tarball_parser, url_fetcher).crawl
          Package.count.must_equal package_count
        end
      end
    end
  end
end
