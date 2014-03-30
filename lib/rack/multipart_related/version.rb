module Rack
  class MultipartRelated
    version = nil
    version = $1 if ::File.expand_path('../../..', __FILE__) =~ /\/rack-multipart_related-([\w\.\-]+)/
    version = nil unless /^([^-]+)-([0-9]+)-[^-]+$/.match(version)
    if version.nil? && ::File.exists?(::File.expand_path('../../../../.git', __FILE__))
      begin
        require "step-up"
        version = StepUp::Driver::Git.last_version
      rescue LoadError
        puts "Warning: no step-up gem is intalled, please install it to use rack-multipart_related from git"
      end
    end
    version = "0.0.0" if version.nil?
    VERSION = version.gsub(/^v?([^\+]+)\+?\d*$/, '\1')
  end
end
