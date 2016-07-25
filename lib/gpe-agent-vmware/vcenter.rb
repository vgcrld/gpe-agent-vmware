module Gpe; module Agent; module Vmware

  class Vcenter

    include Gpe::Agent::Vmware::Helpers

    attr_reader :options,
                :vcenter,
                :perfman, 
                :viewman,
                :root,
                :uuid,
                :si,
                :connect_time,
                :start_time,
                :end_time

    # Class method to create vCenter Connection
    def self.connect( options )
      self.new( options )
    end

    # Intialize the vCenter (connection) object
    def initialize( options )
      @options = options
      @vcenter = login options
      setup
    end

    # Create all instance various to Vcenter Content
    def setup
      @perfman       = @vcenter.serviceContent.perfManager
      @viewman       = @vcenter.serviceContent.viewManager
      @root          = @vcenter.root
      @uuid          = @vcenter.instanceUuid
      @si            = @vcenter.serviceInstance
      @connect_time  = server_time
      @end_time      = @connect_time.strftime("%Y-%m-%dT%H:%M:%SZ")
      @start_time    = (@connect_time - 1200).strftime("%Y-%m-%dT%H:%M:%SZ")
    end

    # Close this session
    def close
      @vcenter.close
    end

    # Close if opened and reconnect
    def reconnect
      close if connected?
      @vcenter = login options 
      setup
      return self
    end

    # Server time
    def server_time
      @si.CurrentTime
    end

    # Are we connected to the vCenter
    def connected?
      begin
        @vcenter.serviceInstance.CurrentTime
      rescue
        return false
      end
      return true
    end

    # Set debug on (or off)
    def debug=( state = true )
      @vcenter.debug = state
      @options[:debug] = @vcenter.debug
    end

    # Methods below are unavailble execpt to this class
    private 
    
    def login( options )
      login = nil
      begin
        login = RbVmomi::VIM.connect options
      rescue => exception
        raise  Gpe::Agent::Vmware::InvalidLogin.new exception, options
      end
    end

  end

end; end; end
