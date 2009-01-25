# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class PageGroupRbacMigratorExtension < Radiant::Extension
  version "1.0"
  description "Provides migrations to move from PageGroupPermissionsExtension to RbacBaseExtension and RbacPageEditExtension"
  url "http://saturnflyer.com/"
  
  class MissingRequirement < StandardError; end
  
  def activate
    raise PageGroupRbacMigratorExtension::MissingRequirement.new('RbacBaseExtension must be installed and loaded first.') unless defined?(RbacBaseExtension) && defined?(PageGroupRbacMigratorExtension)
  end
  
end