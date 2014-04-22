require 'test_helper'

describe "extracting information from the package tarball" do
  it "carves out the package title, storing it into the db" do
    skip "This is going to take FOREVER, can't really run this test"
    `rake crawl`
    Package.first.title.wont_be_nil
  end
end
