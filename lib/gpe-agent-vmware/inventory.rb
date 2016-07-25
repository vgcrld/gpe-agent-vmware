module Gpe; module Agent; module Vmware

  class Inventory < Hash

    # Create the Inventory Object; pass options for CreateContainerView
    def initialize( vcenter, options = {} )
      @vcenter = vcenter
      get_inventory options
    end

    # Get the Full inventory
    def get_inventory( options )
      inventory = @vcenter.viewman.CreateContainerView( options ).view.flatten
      inventory.each do |entity|
        type = entity.class.to_s.to_sym
        self[type] ||= []
        self[type] << Vmware::Entity.make( entity, @vcenter )
      end
      return nil
    end

    # Return the objects as an array
    def all
      self.values.flatten
    end

  end

end; end; end
