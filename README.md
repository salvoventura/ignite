![Ignite](https://github.com/salvoventura/ignite/raw/master/dist/images/color-logo.png)

# Description

Ignite is a tool to bootstrap your network. It supports Cisco Nexus switches leveraging Power-On Auto Provisioning (POAP) capabilities.

Ignite provides bootstrapping with the following capabilities:
* Topology design
* Configuration design
* Image and configuration store for POAP
* POAP request handler


This fork introduces changes to further simplify the deployment. In particular:
* apache integration
* support sqlite
* installer for Ubuntu (tested Ubuntu 15, server, x64)

# Getting Started
## Option 1
1. Install Ubuntu 15 server:
   * only include OpenSSH as optional package

2. Configure networking on the Ubuntu machine:
   * IP address, routing, proxy if needed...
   * make sure official ubuntu repositories are reachable by testing
   ```
   sudo apt-get update
   sudo apt-get install unzip
   ```

3. Download the zip file on the Ubuntu machine from here:
   [master.zip](https://github.com/salvoventura/ignite/archive/master.zip)

   ```
   sudo wget https://github.com/salvoventura/ignite/archive/master.zip
   ```

4. Unzip the archive:

   ```
   sudo unzip master.zip
   ```

5. Run the installer:

   ```
   sudo bash install.sh
   ```

## Option 2
   TBD: OVA download is work-in-progress


# License
Forked from Cisco Datacenter, carries the same APACHE license.


Copyright 2015 Cisco Systems, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
