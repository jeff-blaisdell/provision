#!/bin/bash

echo 'Running chef...'
pushd /opt/chef-solo/provisioning/chef
sudo ./chef-setup.sh
sudo ./chef-execute.sh /opt/chef-solo/provisioning/chef/solo-nodes/local/wpt-stack.json wpt
echo 'Finished chef...'
popd