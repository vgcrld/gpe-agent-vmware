# Requirements
require 'awesome_print'
require 'trollop'
require 'rbvmomi'

# Helpers
require 'gpe-agent-vmware/helpers/helpers'
require 'gpe-agent-vmware/helpers/version'
require 'gpe-agent-vmware/helpers/exceptions'

# GPE
require 'gpe-agent-vmware/config'
require 'gpe-agent-vmware/vcenter'
require 'gpe-agent-vmware/inventory'

# Entities
require 'gpe-agent-vmware/entities/entity'
require 'gpe-agent-vmware/entities/cluster'
require 'gpe-agent-vmware/entities/datacenter'
require 'gpe-agent-vmware/entities/datastore'
require 'gpe-agent-vmware/entities/folder'
require 'gpe-agent-vmware/entities/host'
require 'gpe-agent-vmware/entities/network'
require 'gpe-agent-vmware/entities/resource_pool'
require 'gpe-agent-vmware/entities/virtual_port_group'
require 'gpe-agent-vmware/entities/virtual_switch'
require 'gpe-agent-vmware/entities/vm'

# Run code in here when required and exiting (BEGIN and END blocks)
require 'gpe-agent-vmware/helpers/setup'


