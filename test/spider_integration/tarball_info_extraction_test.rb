require 'test_helper'

module CranCrawler
  module Test
    describe "extracting info from the package tarball" do
      it "carves out the package title" do
        tarball_info = TarballParser.new.extract_info(File.read("test/file_fixtures/A3_0.9.2.tar.gz"))
        tarball_info["Title"].wont_be_nil
      end
    end
  end
end
