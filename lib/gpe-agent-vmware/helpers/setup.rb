# Code in the BEGIN block is run when the file is "required"
BEGIN {

  Vmware = Gpe::Agent::Vmware

  @vc = Vmware::Vcenter.connect( 
    host: 'gvicvc6app01.ats.local',
    user: 'rdavis@ats.local',
    password: 'bmc123!@#',
    insecure: true,
    debug: false
    )
  
  @clusters = Vmware::Inventory.new( @vc, recursive: true, container: @vc.root, type: %w[ ClusterComputeResource ] )
  @hosts    = Vmware::Inventory.new( @vc, recursive: true, container: @vc.root, type: %w[ HostSystem ] )
  @vms      = Vmware::Inventory.new( @vc, recursive: true, container: @vc.root, type: %w[ VirtualMachine ] )
  @folders  = Vmware::Inventory.new( @vc, recursive: true, container: @vc.root, type: %w[ Folder ] )
  @networks = Vmware::Inventory.new( @vc, recursive: true, container: @vc.root, type: %w[ Network ] )
  
}

# Code here is run in almost all cases when terminating
END {
  @vc.close
}

