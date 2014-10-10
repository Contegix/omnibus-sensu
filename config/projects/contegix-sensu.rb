
name "contegix-sensu"
maintainer "Contegix LLC"
homepage "https://www.contegix.com"

replaces        "contegix-sensu"
install_path    "/opt/contegix/sensu"
#build_version   Omnibus::BuildVersion.new.semver
build_version   "0.13.1"
build_iteration 2

# creates required build directories
dependency "preparation"

# sensu dependencies/components
dependency "ruby"
dependency "sensu"
dependency "ubersmithrb"

# version manifest file
dependency "version-manifest"

# config files
config_file "#{install_path}/etc/sysconfig/sensu"

exclude "\.git*"
exclude "bundler\/git"
