class InternalUsers < ActiveRecord::Base
	
	def initialize(args = nil)
		super
		@ldap = Net::LDAP.new(
      :host => 'domctl01', 
      :port => 389, 
      :auth => { method: :simple, username: 'internal\\jglassman', password: 'zooter8!Zoofums' } )
    if @ldap.bind
		  logger.info 'In!'
		end
		ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => 'db/development.sqlite3')
	end
	
	# updates local user DB from internal AD, should run once a day or so?
  def update_from_ad
    if @ldap.bind
    	treebase = "ou=Pasadena Office, dc=cogentinternal, dc=com"
    	filter = Net::LDAP::Filter.eq("objectclass", "person") &
    	  Net::LDAP::Filter.eq("objectclass", "user") &
    	  Net::LDAP::Filter.eq("objectclass", "organizationalPerson")
    	attrs = ["name","userprincipalname"]
    	scope = Net::LDAP::SearchScope_SingleLevel
    	@ldap.search(:base => treebase, :attributes => attrs, return_result: false, scope: scope) do |entry|
    		entry.each do |attr, values|
    			puts "#{attr}: #{values[0]}"
    			case attr.to_s
    			when "name"
    				puts 'name attr'
    				user = InternalUsers.find_by_sql ["select * from internal_users where name = ?", values[0]]
    				unless user.empty?
    					puts 'name not nil'
    					if user.name != values[0]
    						user.update_attribute(name: values[0])
    					end
    					user.save if user.changed?
    				else
    					puts 'new user'
    					user = InternalUsers.new(name: values[0], username: nil, email: nil)
    				end
    			when "userprincipalname"
    				put 'userpri attr'
    				user = InternalUsers.find_by_sql ["select * from internal_users where email = ?", values[0]]
    				unless user.nil?
    					username = attr.split('@')[0]
    					if user.email != values[0]
    						user.update_attribute(email: values[0])
    					end
    					if user.username != username
    						user.update_attribute(username: username)
    					end
    					user.save unless !user.changed?
    				else
    					puts 'saving rest of new user'
    					user.username = username
    					user.email = values[0]
    					user.save
    				end    					
    			end
				end
  		end
  	end
  end
  
end
