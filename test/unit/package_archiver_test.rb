require "test_helper"

module CranCrawler
  module Test
  describe Spider do
    describe "#crawl" do
      let(:archiver) { mock }
      let(:package_parser) { stub }
  
      it "saves all packages into the archive" do
        package_parser.stubs(:packages).returns([
          { "Package" => "a" },
          { "Package" => "b" },
          { "Package" => "c" }
        ])
        archiver.expects(:store).times(3)
  
        Spider.new(package_parser, archiver).crawl
      end
    end
  end
  end
end
