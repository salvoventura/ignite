![Ignite](https://github.com/salvoventura/ignite/blob/master/dist/images/color-logo.png)

# Description

Ignite is a tool to bootstrap your network. It supports Cisco Nexus switches leveraging Power-On Auto Provisioning (POAP) capabilities.

Ignite provides bootstrapping with the following capabilities:
* Topology design
* Configuration design
* Image and configuration store for POAP
* POAP request handler


This fork introduces changes to further simplify the deployment. In particular:
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
```
3. Download the installer bundle on the Ubuntu machine from here:
   [ignite-bundle.sh](../blob/master/package/ignite-bundle.sh)

```
   sudo wget https://github.com/salvoventura/ignite/blob/master/package/ignite-bundle.sh
```

4. Run the bundle file:
```
   sudo bash ignite-bundle.sh
```

### Notes
* Transfering the ignite-bundle.sh via WinScp is known to possibly corrupt
  it, even if transfer mode is set to binary. It is best to follow the wget
  approach from within the Ubuntu machine.

* If that is not feasable, then transfer the whole zip file onto the server,
  extract it locally and run the bundle file.


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
