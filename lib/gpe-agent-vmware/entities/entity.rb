module Gpe; module Agent; module Vmware

    class Entity

      # Entity Data
      attr_reader :ref,
                  :name,
                  :type,
                  :id,
                  :config

      # Create an inventory object from the entity reference (ref) and options
      def self.make( ref, vcenter )
        type = ref.class.to_s.to_sym
        return Vmware::Vm.new( ref, vcenter )               if type == :VirtualMachine
        return Vmware::Host.new( ref, vcenter )             if type == :HostSystem
        return Vmware::Cluster.new( ref, vcenter )          if type == :ClusterComputeResource
        return Vmware::Datacenter.new( ref, vcenter )       if type == :Datacenter
        return Vmware::Datastore.new( ref, vcenter )        if type == :Datastore
        return Vmware::Folder.new( ref, vcenter )           if type == :Folder
        return Vmware::Network.new( ref, vcenter )          if type == :Network
        return Vmware::VirtualSwitch.new( ref, vcenter )    if type == :VmwareDistributedVirtualSwitch
        return Vmware::VirtualPortgroup.new( ref, vcenter ) if type == :DistributedVirtualPortgroup
        return Vmware::ResourcePool.new( ref, vcenter )     if type == :ResourcePool
      end

      # Create an Entity 
      def initialize( ref, vcenter )
        @vcenter = vcenter
        @ref     = ref
        @name    = @ref.name
        @type    = ref.class.to_s.to_sym
        @id      = @ref.to_s.match(/"(.*)"/)[1].to_s
        @config  = Vmware::CONFIG[type].nil? ? {} : Vmware::CONFIG[type]
      end

      # Build query spec from metric tuples
      def query_spec( opts = {} )
        entity = self.ref
        entity = self.name if opts[:printable]
        metrics = @metrics 
        {
           startTime: @vcenter.start_time,
             endTime: @vcenter.end_time,
              entity: entity,
              format: 'normal',
          intervalId: 20,
            metricId: metrics.map{ |metric| { counterId: metric.first, instance: metric.last  } }
        }
      end

      # Inspect - fix awesome_print mess
      def inspect
        return "#{@name}:#{@id}"
      end

    end

end; end; end
