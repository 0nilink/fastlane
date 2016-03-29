require './integration/example_matcher.rb'

apple_id = ENV['SPACESHIP_INTEGRATION_TEST_APPLE_ID']
password = ENV['SPACESHIP_INTEGRATION_TEST_APPLE_PASSWORD']

unless apple_id && password
  raise "You must set SPACESHIP_INTEGRATION_TEST_APPLE_ID and SPACESHIP_INTEGRATION_TEST_APPLE_PASSWORD environment variables"
end
Spaceship::Portal.login(apple_id, password)
Spaceship::Tunes.login(apple_id, password)

RSpec.configure do |config|
  # This is currently causing some tests to be run twice when combined with specifying
  # test patterns on the command line. We should figure out how to reconcile these
  # two things!
  config.pattern = './integration/**/*_spec.rb'
end
