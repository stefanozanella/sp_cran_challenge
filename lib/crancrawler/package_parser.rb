require 'dcf'
require 'httparty'

module CranCrawler
  class PackageParser
    INDEXED_FIELDS = [
      "Package",
      "Version",
    ]

    def packages
      pruned_package_list
    end

    private

    BASE_URL = "http://cran.r-project.org/src/contrib"

    def package_list
      Dcf.parse HTTParty.get("#{BASE_URL}/PACKAGES")
    end

    def pruned_package_list
      package_list.map { |pkg| pkg.select { |k,v| INDEXED_FIELDS.include? k } }
    end
  end
end
