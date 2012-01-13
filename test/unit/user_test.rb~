require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "user attributes must not be empty" do
		user = User.new
		assert user.invalid?
		assert user.errors[:username].any?
		assert user.errors[:name].any?
		assert user.errors[:email].any?
		assert user.errors[:password_digest].any?
		assert user.errors[:group_id].any?
	end
	test "username must be 1 <= chars <= 254" do
		user = User.new(
			group_id: 1,
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
			group_id: 1,
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
			group_id: 1,
			email: "test@test.com",
			name: "test",
			username: "test"
		)
		user.password_digest = ""
		assert user.invalid?, "password digest has <1 char"
		
		user.password_digest = 'a'*500
		assert user.invalid?, "password digest has >254 char"
		end
		
end
