require 'rubygems/package'
require 'zlib'
require 'dcf'

module CranCrawler
  class TarballParser
    INDEXED_FIELDS = [
      "Title",
      "Description",
    ]

    def extract_info(targz)
      info = {}
      unzipped = Zlib::GzipReader.new(StringIO.new(targz))
      Gem::Package::TarReader.new(StringIO.new(unzipped.read)) do |tar|
        tar.each do |tarfile|
          info = Dcf.parse(tarfile.read) if File.basename(tarfile.full_name) == "DESCRIPTION" 
        end
      end

      pruned(info.first)
    end

    def pruned(info)
      info.select { |k,v| INDEXED_FIELDS.include? k }
    end
  end
end
