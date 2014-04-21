actions :create, :delete, :restart, :reload
default_action :create

attribute :version, :name_attribute => true, :kind_of => String, :required => true
attribute :user, :kind_of => String
attribute :checksum, :kind_of => String

attr_accessor :exists