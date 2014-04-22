require 'test_helper'

describe "crawling the list of packages from CRAN" do
  describe "task `crawl`" do
    let(:first_package_name) { package_list.first["Package"] }
    let(:package_count) { package_list.length }

    before :each do
      Package.delete_all
    end

    it "stores the names of the packages" do
      `rake crawl`
      Package.first.name.must_equal first_package_name
    end

    it "saves all packages" do
      `rake crawl`
      Package.count.must_equal package_count
    end
  end
end
