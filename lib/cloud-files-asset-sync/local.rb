module CloudfileAsset
  module Local
    class << self
      def public_files
        files = Dir[[CloudfileAsset::local_public_path, '**/*.*'].join].reject do |file|
          extension = file.split('.').last
          case extension
            when 'cgi', 'fcgi', 'rb', 'sass'
              true
            else
              false
          end
        end
        return files
      end
      
      # TODO: Is this the same as Action Pack -> ActionView::Helpers::AssetTagHelper private methods?
      def make_relative(filename)
        filename.split(CloudfileAsset::local_public_path).last
      end
      def make_absolute(filename)
        [CloudfileAsset::local_public_path, filename].join
      end
    end
  end
end