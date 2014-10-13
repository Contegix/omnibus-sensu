#
# Copyright 2012-2014 Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name "nokogiri"
default_version "1.6.3.1"

if windows?
  dependency "ruby-windows"
  dependency "ruby-windows-devkit"
else
  dependency "ruby"
  dependency "libxml2"
  dependency "libxslt"
  dependency "libiconv"
  dependency "liblzma"
  dependency "zlib"
end

dependency "rubygems"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  if windows?
    # use the 'fat' precompiled binary bundled with nokogiri
    gem "install nokogiri" \
      " --version '#{version}'", env: env
  else
    # Tell nokogiri to use the system libraries instead of compiling its own
    env["NOKOGIRI_USE_SYSTEM_LIBRARIES"] = "true"

    gem "install nokogiri" \
      " --version '#{version}'" \
      " --" \
      " --use-system-libraries" \
      " --with-xml2-lib=#{install_dir}/embedded/lib" \
      " --with-xml2-include=#{install_dir}/embedded/include/libxml2" \
      " --with-xslt-lib=#{install_dir}/embedded/lib" \
      " --with-xslt-include=#{install_dir}/embedded/include/libxslt" \
      " --with-iconv-dir=#{install_dir}/embedded" \
      " --with-zlib-dir=#{install_dir}/embedded", env: env
  end
end
