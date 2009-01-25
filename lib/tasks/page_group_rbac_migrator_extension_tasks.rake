namespace :radiant do
  namespace :extensions do
    namespace :page_group_rbac_migrator do
      
      desc "Runs the migration of the Page Group Rbac Migrator extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          PageGroupRbacMigratorExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          PageGroupRbacMigratorExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Page Group Rbac Migrator to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        Dir[PageGroupRbacMigratorExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(PageGroupRbacMigratorExtension.root, '')
          directory = File.dirname(path)
          puts "Copying #{path}..."
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
