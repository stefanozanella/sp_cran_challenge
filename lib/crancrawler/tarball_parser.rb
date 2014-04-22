require 'rubygems/package'
require 'zlib'
require 'dcf'

module CranCrawler
  class TarballParser
    INDEXED_FIELDS = [
      "Title",
      "Description",
      "Author",
    ]

    def extract_info(targz)
      info = {}
      unzipped = Zlib::GzipReader.new(StringIO.new(targz))
      Gem::Package::TarReader.new(StringIO.new(unzipped.read)) do |tar|
        tar.each do |tarfile|
          info = Dcf.parse(tarfile.read) if File.basename(tarfile.full_name) == "DESCRIPTION" 
        end
      end

      structured(pruned(info.first))
    end

    private

    def pruned(info)
      info.select { |k,v| INDEXED_FIELDS.include? k }
    end

    def structured(info)
      info["authors_attributes"] = parse_authors(info["Author"])
      info
    end

    def parse_authors(authors)
      authors.split(/,\s*/).map do |author|
        { "name" => author }
      end
    end
  end
end
