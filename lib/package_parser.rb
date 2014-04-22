require 'dcf'
require 'httparty'

module CranCrawler
  class PackageParser
    def packages
      pruned_package_list
    end

    private

    def package_list
      Dcf.parse HTTParty.get("http://cran.r-project.org/src/contrib/PACKAGES")
    end

    def pruned_package_list
      package_list.map { |pkg| pkg.select { |k,v| k == "Package" } }
    end
  end
end
