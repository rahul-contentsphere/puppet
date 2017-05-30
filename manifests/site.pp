#import 'cs-csmodule'

#include scp
#import 'puppet.pp'
#import 'agent1.pp'
#notify {"Agent connection is successful": }
node 'slave1' {

include cs-csmodule::0create_dir_structure,cs-csmodule::1scp_base_packages,cs-csmodule::2extract_base_packages,cs-csmodule::3scp_plugins_war,cs-csmodule::3_9update_plugins_war,cs-csmodule::4update_plugins_war, cs-csmodule::5scp_scripts

Class['cs-csmodule::0create_dir_structure'] -> Class['cs-csmodule::1scp_base_packages'] -> Class['cs-csmodule::2extract_base_packages'] -> Class['cs-csmodule::3scp_plugins_war'] -> Class['cs-csmodule::3_9update_plugins_war'] -> Class['cs-csmodule::4update_plugins_war'] -> Class['cs-csmodule::5scp_scripts']

#include cs-csmodule::5scp_scripts
#include cs-csmodule::4update_plugins_war
#include cs-csmodule::6stop_application
#include cs-csmodule::7start_application
#include cs-csmodule::3_9update_plugins_war
}



node 'python' {

include cs-csmodule::0create_dir_structure,cs-csmodule::1scp_base_packages,cs-csmodule::2extract_base_packages,cs-csmodule::3scp_plugins_war,cs-csmodule::3_9update_plugins_war,cs-csmodule::4update_plugins_war, cs-csmodule::5scp_scripts

Class['cs-csmodule::0create_dir_structure'] -> Class['cs-csmodule::1scp_base_packages'] -> Class['cs-csmodule::2extract_base_packages'] -> Class['cs-csmodule::3scp_plugins_war'] -> Class['cs-csmodule::3_9update_plugins_war'] -> Class['cs-csmodule::4update_plugins_war'] -> Class['cs-csmodule::5scp_scripts']

#include cs-csmodule::5scp_scripts
#include cs-csmodule::4update_plugins_war
#include cs-csmodule::6stop_application
#include cs-csmodule::7start_application
#include cs-csmodule::3_9update_plugins_war
}


