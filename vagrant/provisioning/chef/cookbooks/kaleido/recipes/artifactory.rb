
# Install artifactory as service.
artifactory_service '3.2.0' do
	user = 'artifactory'
	action :create
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