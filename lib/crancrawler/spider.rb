require 'crancrawler/package_parser'
require 'crancrawler/archiver'
require 'crancrawler/url_fetcher'
require 'crancrawler/tarball_parser'

module CranCrawler
  class Spider
    def initialize(package_parser = PackageParser.new, archiver = Archiver.new, tarball_parser = TarballParser.new, url_fetcher = URLFetcher.new)
      @package_parser = package_parser
      @tarball_parser = tarball_parser
      @archiver = archiver
      @url_fetcher = url_fetcher
    end

    def crawl
      @package_parser.packages.each do |package|
        additional_info = @tarball_parser.extract_info(@url_fetcher.fetch_package(package))
        @archiver.store(package.merge additional_info)
      end
    end
  end
end
