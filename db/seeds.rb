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
  username: "jordan",
  name: "Jordan Glassman",
  email: "jpglassman@gmail.com",
  group_id: 3,
  password_digest: "jgdfjgj")

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
