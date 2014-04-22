require 'package_parser'
require 'archiver'

module CranCrawler
  class Spider
    def initialize(package_parser = PackageParser.new, archiver = Archiver.new)
      @package_parser = package_parser
      @archiver = archiver
    end

    def crawl
      @package_parser.packages.each do |package|
        @archiver.store(package)
      end
    end

  end
end
