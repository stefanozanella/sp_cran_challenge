module CranCrawler
  class URLFetcher
    BASE_URL = "http://cran.r-project.org/src/contrib"

    def fetch_package(package)
      HTTParty.get("#{BASE_URL}/#{package["Title"]}_#{package["Version"]}.tar.gz")
    end
  end
end
