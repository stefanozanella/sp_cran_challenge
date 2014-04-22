require 'test_helper'

describe "crawling the list of packages from CRAN" do
  describe "task `crawl`" do
    let(:first_package_name) { package_list.first["Package"] }

    it "stores the names of the packages" do
      `rake crawl`
      Package.first.name.must_equal first_package_name
    end
  end
end
