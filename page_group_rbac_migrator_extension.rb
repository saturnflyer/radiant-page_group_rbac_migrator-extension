# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class PageGroupRbacMigratorExtension < Radiant::Extension
  version "1.0"
  description "Provides migrations to move from PageGroupPermissionsExtension to RbacPageEditExtension and RbacPageEditExtension"
  url "http://saturnflyer.com/"
  
  class MissingRequirement < StandardError; end
  
  def activate
    raise PageGroupRbacMigratorExtension::MissingRequirement.new('RbacPageEditExtension and PageGroupPermissionsExtension must be installed and loaded first.') unless defined?(RbacPageEditExtension) && defined?(PageGroupPermissionsExtension)
  end
  
end