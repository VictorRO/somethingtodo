# Support for Rspec / Capybara subdomain integration testing
# Make sure this file is required by spec_helper.rb
#
# Sample subdomain test:
# it "should test subdomain" do
#   switch_to_subdomain("mysubdomain")
#   visit root_path
# end

def local_virtual_host
    ENV['LOCAL_VIRTUAL_HOST'] || 'lvh.me'
end

def switch_to_subdomain(subdomain)
  Capybara.app_host = Capybara.app_host = "http://#{subdomain}.#{local_virtual_host}"
end

def switch_to_main_domain
  Capybara.app_host = "http://#{local_virtual_host}"
end

RSpec.configure do |config|
  switch_to_main_domain
end

Capybara.configure do |config|
  config.always_include_port = true
end
