#$destPath = "/tmp/testfolder"
#$sourcePath = "master/files" #here, master is the hostname

class cs-csmodule::5scp_scripts inherits cs-csmodule {
#$destPath = "/tmp/testfolder"
#$sourcePath = "master/files" #here, master is the hostname


file { "/$scriptDestPath/config.properties":
        mode => "0777",
        owner => 'cs',
        group => 'cs',
        source => "puppet://${sourcePath}/${moduleName}/${scriptsFolder}/config.properties",
    }

file { "/$scriptDestPath/1backup.sh":
        mode => "0777",
        owner => 'cs',
        group => 'cs',
        source => "puppet://${sourcePath}/${moduleName}/${scriptsFolder}/1backup.sh",
    }

file { "/$scriptDestPath/2stopElastic.sh":
        mode => "0777",
        owner => 'cs',
        group => 'cs',
        source => "puppet://${sourcePath}/${moduleName}/${scriptsFolder}/2stopElastic.sh",
    }
file { "/$scriptDestPath/3stopOrientdb.sh":
        mode => "0777",
        owner => 'cs',
        group => 'cs',
        source => "puppet://${sourcePath}/${moduleName}/${scriptsFolder}/3stopOrientdb.sh",
    }
file { "/$scriptDestPath/4stopTomcat.sh":
        mode => "0777",
        owner => 'cs',
        group => 'cs',
        source => "puppet://${sourcePath}/${moduleName}/${scriptsFolder}/4stopTomcat.sh",
    }

file { "/$scriptDestPath/5clearlogs.sh":
        mode => "0777",
        owner => 'cs',
        group => 'cs',
        source => "puppet://${sourcePath}/${moduleName}/${scriptsFolder}/5clearlogs.sh",
    }

file { "/$scriptDestPath/6clearData.sh":
        mode => "0777",
        owner => 'cs',
        group => 'cs',
        source => "puppet://${sourcePath}/${moduleName}/${scriptsFolder}/6clearData.sh",
    }
#file { "/$scriptDestPath/7removePlugins.sh":
#        mode => "0644",
#        owner => 'cs',
#        group => 'cs',
#        source => "puppet://${sourcePath}/${moduleName}/${scriptsFolder}/7removePlugins.sh",
#    }


#file { "/$scriptDestPath/8removeWar.sh":
#        mode => "0644",
#        owner => 'cs',
#        group => 'cs',
#        source => "puppet://${sourcePath}/${moduleName}/${scriptsFolder}/8removeWar.sh",
#    }
#file { "/$scriptDestPath/9addPlugins.sh":
#        mode => "0644",
#        owner => 'cs',
#        group => 'cs',
#        source => "puppet://${sourcePath}/${moduleName}/${scriptsFolder}/9addPlugins.sh",
#    }
#file { "/$scriptDestPath/10addWar.sh":
#        mode => "0644",
#        owner => 'cs',
#        group => 'cs',
#        source => "puppet://${sourcePath}/${moduleName}/${scriptsFolder}/10addWar.sh",
#    }
#
#
file { "/$scriptDestPath/7startElastic.sh":
        mode => "0777",
        owner => 'cs',
        group => 'cs',
        source => "puppet://${sourcePath}/${moduleName}/${scriptsFolder}/7startElastic.sh",
    }
file { "/$scriptDestPath/8startOrientdb.sh":
        mode => "0777",
        owner => 'cs',
        group => 'cs',
        source => "puppet://${sourcePath}/${moduleName}/${scriptsFolder}/8startOrientdb.sh",
    }
file { "/$scriptDestPath/9startTomcat.sh":
        mode => "0777",
        owner => 'cs',
        group => 'cs',
        source => "puppet://${sourcePath}/${moduleName}/${scriptsFolder}/9startTomcat.sh",
    }

file { "/$scriptDestPath/main.sh":
        mode => "0777",
        owner => 'cs',
        group => 'cs',
        source => "puppet://${sourcePath}/${moduleName}/${scriptsFolder}/main.sh",
    }

file { "/$scriptDestPath/configureElasticTomcatIP.sh":
        mode => "0777",
        owner => 'cs',
        group => 'cs',
        source => "puppet://${sourcePath}/${moduleName}/${scriptsFolder}/configureElasticTomcatIP.sh",
    }


#notify {"Exiting 1scp_base_packages": }
}
