# Copyright 2015 CREATE-NET
#
# Licensed under the Apache License, Version 2.0 (the "License"); you
# may not use this file except in compliance with the License. You may
# obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied. See the License for the specific language governing
# permissions and limitations under the License.

class fuel_plugin_calamari::agent::init {

  notice('Starting calamari-agent manifest')

  include fuel_plugin_calamari::agent::params

  package { $fuel_plugin_calamari::agent::params::packages:
    ensure => present,
    }->
      file { $fuel_plugin_calamari::agent::params::salt_file:
        ensure  => file,
        content => "master: ${fuel_plugin_calamari::agent::params::calamari_ip}"
        }~>
        service{ $fuel_plugin_calamari::agent::params::services:
          enable => true,
        }

        notice('End of calamari-agent manifest')

}