module CranCrawler
  class Archiver
    def store(pkg)
      Package.new(pkg).save
    end
  end
end
