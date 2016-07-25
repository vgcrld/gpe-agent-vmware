module Gpe; module Agent; module Vmware

  class InvalidLogin < Exception
    def initialize( exception, options)
      puts "Unable to log into vcenter: #{options[:host]}, exception: #{exception.message}"
      exit 1
    end
  end

end; end; end
