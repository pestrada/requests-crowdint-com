Before('@omniauth') do
  OmniAuth.config.test_mode = true

  # the symbol passed to mock_auth is the same as the name of the provider set up in the initializer
  OmniAuth.config.mock_auth[:crowdint_auth] = {
      uid:        '123456',
      provider:   'crowdint_auth',
      info: {
          email:  'test@xxxx.com',
          name:   'Test User'
      }
  }
end

After('@omniauth') do
  OmniAuth.config.test_mode = false
end
