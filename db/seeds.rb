# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Group.delete_all

Group.create(
    gid: 1,
		name: 'Super Users')

Group.create(
    gid: 2,
		name: 'Management Group')

Group.create(
    gid: 3,  
		name: 'Project Managers')

Group.create(
    gid: 4,  
		name: 'Technical Leads')

User.delete_all

User.create(
	uid: 1,
  username: "jordan",
  name: "Jordan Glassman",
  email: "jpglassman@gmail.com",
  group_id: 3,
  password_digest: "encrypted password")

User.create(
	uid: 2,
  username: "randy",
  name: "Randybob Winklevoss",
  email: "test@test.com",
  group_id: 1,
  password_digest: "encrypted password")

Project.delete_all

Project.create(
	name: 'Imperial County',
	description: 'Simple CAFIS Prime',
	priority: 2,
	project_manager: 'Greg Morgon',
	technical_lead: 'Jordan Glassman',
	pm_uid: 1,
	tl_uid: 2,
	due_date: Date.new(2012,1,17),
	phase: 'To be delivered',
	status: 'In progress',
	status_last_updated: DateTime.new(2012,1,5,15,13)
	)

Project.create(
	name: 'The Moon',
	description: 'Very Futuristic CAFIS System',
	priority: 1,
	project_manager: 'Robert Heinlein',
	technical_lead: 'Arthur C. Clarke',
	pm_uid: 1,
	tl_uid: 2,	
	due_date: Date.new(2013,2,23),
	phase: 'Ongoing support',
	status: 'Project created',
	status_last_updated: DateTime.new(2012,1,4,11,11)
	)

Project.create(
	name: 'St. Paul\'s Cathedral',
	description: %{ Old, Storied CAFIS System That No One Cares About Anymore 
	(which also has a very, very, very long description for testing purposes) },
	priority: 3,
	project_manager: 'Randybob Winklevoss',
	technical_lead: 'Jimbob Winklevoss',
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
  announcement: 'Don\'t forget to change your password')

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
  task_id: 1,
  project_id: 1,
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
  task_id: 2,
  project_id: 2,
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
  task_id: 3,
  project_id: 2,
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
  task_id: 4,
  project_id: 3,
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
