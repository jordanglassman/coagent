require 'test_helper'
require 'internal_users.rb'

class UserTest < ActiveSupport::TestCase
	test "user attributes must not be empty" do
		user = User.new
		assert user.invalid?
		assert user.errors[:username].any?
		assert user.errors[:name].any?
		assert user.errors[:email].any?
		assert user.errors[:password_digest].any?
	end
	test "username must be 1 <= chars <= 254" do
		user = User.new(
			email: "test@test.com",
			name: "test",
			password_digest: "test"
		)
		user.username = ""
		assert user.invalid?
		user.username = 'a'*500
		assert user.invalid?
	end
	test "name must be 1 <= chars <= 254" do
		user = User.new(
			email: "test@test.com",
			username: "test",
			password_digest: "test"
		)
		user.name = ""
		assert user.invalid?
		user.name = 'a'*500
		assert user.invalid?
	end
	test "password_digest must be 1 <= chars <= 254" do
		user = User.new(
			email: "test@test.com",
			name: "test",
			username: "test"
		)
		user.password_digest = ""
		assert user.invalid?, "password digest should fail due to <1 char"
		assert_equal "can't be blank; is too short (minimum is 1 characters)",user.errors[:password_digest].join('; ')
		user.password_digest = 'a'*500
		assert user.invalid?, "password digest should fail due to >254 char"
		assert_equal "is too long (maximum is 254 characters)",user.errors[:password_digest].join('; ')
		end
	test "email must be 3 <= chars <= 254" do
		user = users(:one)
		user.email = 'd'
		assert user.invalid?, "email should fail due to <3 char"
		assert_equal "is too short (minimum is 3 characters); is not valid",user.errors[:email].join('; ')
		user.email = 'a'*500
		assert user.invalid?, "email should fail due to >254 char"
		assert_equal "is too long (maximum is 254 characters); is not valid",user.errors[:email].join('; ')
	end
	test "email must be in the correct format" do
	  user = users(:one)
	  user.email = 'fdsaffsdfad'
	  assert user.invalid?,"should be invalid due to being a single word"
 	  user.email = 'fdsaffsdfad@'
	  assert user.invalid?,"should be invalid due to having a blank domain"
	  user.email = '@fdsaffsdfad'
	  assert user.invalid?,"should be invalid due to being a blank username"
	  user.email = '$@#$!#$@jkfjdsklf.com'
	  assert user.invalid?,"should be invalid due to special characters"
	end
	test "email must be unique" do
	  user = User.new(
	      username: "MyUsername",
	      name: "MyString",
	      email: users(:user_with_valid_email).email,
	      password_digest: "MyStringusername"
	  )
	  assert user.invalid?
	  assert_equal "has already been taken",user.errors[:email].join('; ')
	end
end
