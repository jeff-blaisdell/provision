#!/bin/bash

echo 'Running chef...'
pushd /opt/chef-solo/provisioning/chef
sudo ./chef-setup.sh
sudo ./chef-execute.sh /opt/chef-solo/provisioning/chef/solo-nodes/local/redis-stack.json redis
echo 'Finished chef...'
popd