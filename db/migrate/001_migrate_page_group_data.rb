class MigratePageGroupData < ActiveRecord::Migration
  def self.up
    @groups = Group.find(:all)
    @groups.each do |group|
      role = Role.find_or_create_by_role_name(group.name)
      group_pages = Page.find_all_by_group_id(group.id)
      group_pages.each do |group_page|
        group_page.update_attribute(:role_id, role.id)
      end
      role.users << group.users
    end
  end
  def self.down
    # this isn't needed
  end
end