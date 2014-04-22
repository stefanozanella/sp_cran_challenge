require "test_helper"

module CranCrawler
  module Test
  describe Spider do
    describe "#crawl" do
      let(:archiver) { mock }
      let(:package_parser) { mock }
      let(:tarball_parser) { mock }
      let(:url_fetcher) { mock }
      let(:spider) { Spider.new(package_parser, archiver, tarball_parser, url_fetcher) }

      it "saves all packages into the archive" do
        package_parser.stubs(:packages).returns([
          { "Package" => "a" },
          { "Package" => "b" },
          { "Package" => "c" }
        ])
        archiver.expects(:store).times(3)
  
        url_fetcher.stub_everything
        tarball_parser.stubs(:extract_info).returns({})

        spider.crawl
      end

      it "fetches additional info for each package from the tar.gz" do
        package = { "Package" => "a", "Version" => "0.1.2" }
        package_parser.stubs(:packages).returns([
          package
        ])

        tarball_parser.expects(:extract_info).once.returns(
          { "Title" => "a simple title" }
        )

        archiver.expects(:store).once.with() { |pkg_hash|
          pkg_hash["Title"] == "a simple title"
        }

        url_fetcher.expects(:fetch_package).with(package).returns("")
        spider.crawl
      end
    end
  end
  end
end
