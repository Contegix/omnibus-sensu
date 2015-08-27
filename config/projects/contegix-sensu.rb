
name "contegix-sensu"
maintainer "Contegix LLC"
homepage "https://www.contegix.com"

replaces        "contegix-sensu"
install_dir     "/opt/contegix/sensu"
#build_version   Omnibus::BuildVersion.new.semver
build_version   "0.20.3-1"
build_iteration 3

# sensu dependencies/components

dependency "ruby"
dependency "sensu"
dependency "ubersmithrb"

# version manifest file
dependency "version-manifest"

# config files
config_file "#{install_dir}/etc/sysconfig/sensu"

exclude "\.git*"
exclude "bundler\/git"
