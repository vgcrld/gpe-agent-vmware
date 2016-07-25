module Gpe; module Agent; module Vmware

  # What to collect for who.
  CONFIG = {

    Datacenter: {
    },

    Datastore: {
      metrics: [
        [ 'datastore.read.average','' ],
        [ 'datastore.write.average','' ],
      ]
    },

    ClusterComputeResource: {
    },

    Hostsystem: {
      metrics: [
        [ 'cpu.usage.average','' ],
        [ 'mem.usage.average','' ],
        [ 'disk.read.average','*' ],
        [ 'disk.write.average','*' ]
      ]
    },

    VirtualMachine: {
      metrics: [
        [ 'cpu.usage.average','' ],
        [ 'mem.usage.average','' ],
        [ 'disk.read.average','*' ],
        [ 'disk.write.average','*' ]
      ]
    },

  }

  # List Objects to Collect Metrics on
  OBJECTS = CONFIG.keys

end; end; end
