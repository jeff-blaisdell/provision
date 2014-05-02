
# Install artifactory as service.
artifactory_service '3.2.0' do
	user = 'artifactory'
	action :create
end

# Stop service
service "artifactory" do
  action :stop
end

# Bootstrap security configuration.
cookbook_file "/etc/opt/jfrog/artifactory/security.import.xml" do
  source "artifactory-security.import.xml"
  mode 0660
  owner "artifactory"
  group "artifactory"
end

# Start service.
service "artifactory" do
  action :start
end

# Setup reverse proxy for domain http://artifactory.kaleido.io
template "/etc/nginx/sites-available/artifactory" do
  source "nginx-artifactory.erb"
  mode 0440
  owner "root"
  group "root"
end

link "/etc/nginx/sites-enabled/artifactory" do
  to "/etc/nginx/sites-available/artifactory"
end