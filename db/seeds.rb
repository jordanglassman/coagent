# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# makes generic users to populate tables for testing
# also returns a new user so some of those attrs can be used for other seeds
def create_seed_user(name,group)
	new_user = User.create(
		username: name,
		name: name,
		email: "#{name}@cogentsystems.com",
		password: 'password',
		password_confirmation: 'password',
		groups: Group.where("name is ?",group)
	)
	new_user
end

InternalUsers.destroy_all

InternalUsers.create(
  username: "mlee",
  name: "Michael Lee",
  email: "mlee@cogentsystems.com"
  )

InternalUsers.create(
  username: "bchan",
  name: "Brian Chan",
  email: "bchan@cogentsystems.com"
  )

Group.destroy_all

Group.create([
	{id: 1, name: 'Super Users'},
	{id: 2, name: 'Management Group'},
	{id: 3, name: 'Project Managers'},	
	{id: 4, name: 'Technical Leads'}
	])

temp_group = Group.find_by_name('Super Users')
temp_group.id = 1
temp_group.save!
temp_group = Group.find_by_name('Management Group')
temp_group.id = 2
temp_group.save!
temp_group = Group.find_by_name('Project Managers')
temp_group.id = 3
temp_group.save!
temp_group = Group.find_by_name('Technical Leads')
temp_group.id = 4
temp_group.save!

User.destroy_all

#all seeded users have password = 'password'
User.create(
  username: "jordan",
  name: "Jordan Glassman",
  email: "jpglassman@cogentsystems.com",
  password: 'password',
  password_confirmation: 'password',
  groups: Group.where("name is 'Technical Leads'")
)

User.create(
  username: "admin",
  name: "admin",
  email: "admin@cogentsystems.com",
  password: 'password',
  password_confirmation: 'password',
  groups: Group.where("name is 'Super Users'")
)

create_seed_user('su','Super Users')
create_seed_user('su2','Super Users')
create_seed_user('mg','Management Group')
create_seed_user('mg2','Management Group')
new_tl_1 = create_seed_user('tl','Technical Leads')
new_tl_2 = create_seed_user('tl2','Technical Leads')
new_pm_1 = create_seed_user('pm','Project Managers')
new_pm_2 = create_seed_user('pm2','Project Managers')


User.create(
  username: "mlee",
  name: "Michael Lee",
  email: "mlee18@cogentsystems.com",
  password: 'password',
  password_confirmation: 'password',
  groups: Group.where("name is 'Super Users'")
)

User.create(
  username: "wstelz",
  name: "Walt Stelz",
  email: "wstelz@cogentsystems.com",
  password: 'password',
  password_confirmation: 'password',
  groups: Group.where("name is 'Super Users'")
)

User.create(
  username: "gmorgon",
  name: "Greg Morgon",
  email: "gmorgon@cogentsystems.com",
  password: 'password',
  password_confirmation: 'password',
  groups: Group.where("name is 'Super Users'")
)

Project.delete_all

project_1 = Project.create(
	name: 'Imperial County',
	description: 'Simple CAFIS Prime',
	priority: 2,
	project_manager: new_pm_1.id,
	technical_lead: new_tl_1.id,
	due_date: Date.new(2012,1,17),
	phase: 'To be delivered',
	status: 'In progress',
	status_last_updated: DateTime.new(2012,1,5,15,13)
	)

project_2 = Project.create(
	name: 'The Moon',
	description: 'Very Futuristic CAFIS System',
	priority: 1,
	project_manager: new_pm_2.id,
	technical_lead: new_tl_2.id,
	pm_uid: 1,
	tl_uid: 2,	
	due_date: Date.new(2013,2,23),
	phase: 'Ongoing support',
	status: 'Project created',
	status_last_updated: DateTime.new(2012,1,4,11,11)
	)

project_3 = Project.create(
	name: 'St. Paul\'s Cathedral',
	description: %{ Old, Storied CAFIS System That No One Cares About Anymore 
	(which also has a very, very, very long description for testing purposes) },
	priority: 3,
	project_manager: new_pm_1.id,
	technical_lead: new_tl_2.id,
	pm_uid: 1,
	tl_uid: 2,	
	due_date: Date.new(2010,6,15),
	phase: 'Ongoing support',
	status: 'Project delivered and forgotten',
	status_last_updated: DateTime.new(2010,6,16,2,3)
	)

Announcement.delete_all

Announcement.create(
  name: 'Announcement 1',
  announcement: 'Welcome to CoAgent 0.01.  The design goals are to (1) streamline
  project reporting and (2) provide fast planning and tracking for major project milestones.
  If it is a burden to use, then it has failed.  If it turns out to be extra busy work
  for everyone, then we can scrap it.  In the meantime, please help to make it a tool
  you would like to use by providing feedback and suggesting features.')

Announcement.create(
  name: 'Announcement 2',
  announcement: 'Definitely don\'t forget to change your password')

Announcement.create(
  created_at: "2010-01-01",
  updated_at: "2011-01-01",
  name: 'Announcement 3',
  announcement: 'Most Definitely don\'t forget to change your password Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')

Task.delete_all

Task.create(
  project_id: project_1.id,
  name: "MyString",
  description: "MyText",
  due_date: "2012-01-12",
  notes: "MyText",
  severity: 1,
  status: "MyString",
  resource: "MyString",
  deliverable: "MyString",
  completed_date: "2012-01-12 23:47:05",
  priority_task_flag: true)

Task.create(
  project_id: project_2.id,
  name: "MyString",
  description: "MyText",
  due_date: "2012-01-12",
  notes: "MyText",
  severity: 1,
  status: "MyString",
  resource: "MyString",
  deliverable: "MyString",
  completed_date: "2012-01-12 23:47:05",
  priority_task_flag: true)

Task.create(
  project_id: project_3.id,
  name: "MyString",
  description: "MyText",
  due_date: "2012-01-12",
  notes: "MyText",
  severity: 1,
  status: "MyString",
  resource: "MyString",
  deliverable: "MyString",
  completed_date: "2012-01-12 23:47:05",
  priority_task_flag: false)

Task.create(
  project_id: project_1.id,
  name: "MyString",
  description: "MyText",
  due_date: "2012-01-12",
  notes: "MyText",
  severity: 1,
  status: "MyString",
  resource: "MyString",
  deliverable: "MyString",
  completed_date: "2012-01-12 23:47:05",
  priority_task_flag: false)
