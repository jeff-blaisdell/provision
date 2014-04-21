# Support whyrun
def whyrun_supported?
  true
end

action :create do
  if @current_resource.exists
    Chef::Log.info "#{ @new_resource } already exists - nothing to do."
  else
    converge_by("Create #{ @new_resource }") do
      create_artifactory_service
    end
  end
end

action :delete do
  if @current_resource.exists
    converge_by("Delete #{ @current_resource }") do
      delete_artifactory_service
    end
  else
    Chef::Log.info "#{ @current_resource } doesn't exist - can't delete."
  end
end

action :restart do
  converge_by("Restart #{ @current_resource }") do
    service @current_resource.service_name do
      provider Chef::Provider::Service::Upstart
      supports :restart => true
      action :restart
    end
  end
end

action :reload do
  converge_by("Reload #{ @current_resource }") do
    service @current_resource.service_name do
      provider Chef::Provider::Service::Upstart
      supports :reload => true
      action :reload
    end
  end
end


def load_current_resource
  @current_resource = Chef::Resource::ArtifactoryService.new(@new_resource.name)
  @current_resource.user(@new_resource.user)
  @current_resource.version(@new_resource.version)
  @current_resource.checksum(@new_resource.checksum)

  if service_exists?()
    @current_resource.exists = true
  end
end

def create_artifactory_service

  ##################
  src_artifact = "artifactory-#{node[:artifactory][:version]}"
  dest_artifact = "artifactory"
  src_ext = "zip"
  src_filename = "#{src_artifact}.#{src_ext}"
  src_url = "http://superb-dca2.dl.sourceforge.net/project/artifactory/artifactory/#{node[:artifactory][:version]}/#{src_filename}"
  src_filepath = "#{Chef::Config['file_cache_path']}/#{src_filename}"
  extract_path = "/etc/opt/jfrog"
  ##################

  Chef::Log.info "Fetching Artifactory from [#{src_url}]..."
  remote_file src_filepath do
    source src_url
    checksum node[:artifactory][:checksum]
    owner 'root'
    group 'root'
    mode 00644
  end

  bash 'extract_module' do
    cwd ::File.dirname(src_filepath)
    code <<-EOH
      mkdir -p #{extract_path}
      unzip #{src_filename} -d #{extract_path}
      mv #{extract_path}/#{src_artifact} #{extract_path}/#{dest_artifact}
      EOH
    not_if { ::File.exists?(extract_path) }
  end

  bash 'install_module' do
    cwd ::File.dirname(extract_path)
    code <<-EOH
      #{extract_path}/#{dest_artifact}/bin/installService.sh #{node['artifactory']['user']}
      EOH
  end

  service "artifactory" do
    action [ :enable, :start ]
  end

end

def delete_artifactory_service

  ##################
  src_artifact = "artifactory-#{node[:artifactory][:version]}"
  src_ext = ".zip"
  src_filename = "#{src_artifact}.#{src_ext}"
  src_url = "http://sourceforge.net/projects/artifactory/files/artifactory/#{node[:artifactory][:version]}/#{src_filename}/download"
  src_filepath = "#{Chef::Config['file_cache_path']}/#{src_filename}"
  ##################

  bash 'install_module' do
    cwd ::File.dirname(extract_path)
    code <<-EOH
      ./#{src_artifact}/bin/uninstallService.sh
      EOH
  end

end

def service_exists?()
  Chef::Log.debug "Checking to see if artifactory service exists..."
  ::File.directory?("/etc/opt/jfrog/artifactory")
end
