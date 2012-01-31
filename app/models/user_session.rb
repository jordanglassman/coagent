class UserSession < Authlogic::Session::Base
  logout_on_timeout true
  ldap_host = 'domctl01'
  ldap_port = 389
  # returns true...  AD users already authentication by net-ldap
  verify_password_method :valid_ldap_password
end