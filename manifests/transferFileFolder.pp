    file {"/tmp/":
        ensure => file,
    	
	recurse => 'remote',
	    owner => "root",
        group => "root",
        mode => 0644,
        source => "puppet://master/files/*.sh"
}
