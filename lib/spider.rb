require 'dcf'
require 'httparty'

module CranCrawler
  class Spider
    def crawl
      pkgs = Dcf.parse HTTParty.get("http://cran.r-project.org/src/contrib/PACKAGES")
      Package.new(pkgs.first.select { |k,v| k == "Package" }).save
    end
  end
end
