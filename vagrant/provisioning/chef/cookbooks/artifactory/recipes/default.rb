
artifactory_service node['artifactory']['version'] do
	user = node['artifactory']['user']
	action :create
end