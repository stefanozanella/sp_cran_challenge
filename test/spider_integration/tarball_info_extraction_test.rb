require 'test_helper'

module CranCrawler
  module Test
    describe "extracting info from the package tarball" do
      it "carves out the package title" do
        tarball_info = TarballParser.new.extract_info(File.read("test/file_fixtures/A3_0.9.2.tar.gz"))
        tarball_info["Title"].wont_be_nil
      end

      it "parses the author info" do
        tarball_info = TarballParser.new.extract_info(File.read("test/file_fixtures/A3_0.9.2.tar.gz"))
        tarball_info["authors"].must_equal([{ "name" => "Scott Fortmann-Roe" }])
      end

      it "handles the case of multiple authors, with names separated by a comma" do
        tarball_info = TarballParser.new.extract_info(File.read("test/file_fixtures/Actigraphy_1.2.tar.gz"))
        tarball_info["authors"].must_equal([
          { "name" => "William Shannon" },
          { "name" => "Tao Li" },
          { "name" => "Hong Xian" },
          { "name" => "Jia Wang" },
          { "name" => "Elena Deych" },
          { "name" => "Carlos Gonzalez" }
        ])
      end
    end
  end
end
