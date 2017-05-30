class cs-csmodule::0create_dir_structure inherits cs-csmodule {

notify {"In 0create_dir_structure": }

file { [  $basedir,$clientdir, $backupdir, $scriptbasedir, $scriptDestPath ]:
    ensure => 'directory',
  }

}

