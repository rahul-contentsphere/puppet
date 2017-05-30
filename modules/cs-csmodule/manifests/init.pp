# == Class: csmodule
#}
#
# Full description of class csmodule here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'csmodule':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2017 Your name here, unless otherwise noted.
#
#class csmodule {
#}
#import '0variables.pp'
#import '1scpBasePackages.pp'
#import '2extractBasePackages.pp'
#import '3scpPluginsWar.pp'
#import '4updatePluginsWar.pp'

#class csmodule::3scpPluginsWar
#class {'csmodule::4updatePluginsWar': }
class cs-csmodule {
#    include cs-csmodule::install
#    include cs-csmodule::config
#    include cs-csmodule::service
#    include cs-csmodule::0variables
#    include cs-csmodule::3scp
#    include cs-csmodule::4update

#MasterSide
$moduleName = "cs-csmodule"  # required in 5scp_scripts.pp 
$scriptsFolder = "jumboScripts" # required in 5scp_scripts.pp
$warPluginFolder = "pluginWar"


#AgentSide
$basedir = "/opt/cs"
$clientdir = "/opt/cs/jumbo"
$backupdir = "/opt/cs/jumbo/backups"
$scriptbasedir = "/opt/cs/scripts"
$scriptDestPath = "/opt/cs/scripts/jumbo"



#AgentSide
$destPath = "/opt/cs/jumbo"
#MasterSide
$sourcePath = "master/files" #here, master is the hostname
#$moduleWarPluginFolderPath= "/etc/puppet/files/cs-csmodule/pluginWar"
$elasticPort = "9200"
$orinetdbPort = "2480"
$tomcatPort = "8080"
}

