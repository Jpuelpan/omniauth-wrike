# Omniauth Wrike OAuth 2

OmniAuth OAuth2 Strategy to authenticate [Wrike](https://www.wrike.com).

## Usage

Add this line to your application's Gemfile:

```ruby
gem 'omniauth'
gem 'omniauth-wrike'
```

Integrate this strategy to your OmniAuth middleware.

```
use OmniAuth::Builder do
  provider :wrike, ENV['WRIKE_CLIENT_ID'], ENV['WRIKE_CLIENT_SECRET']
end
```

To get your Wrike client ID and Secret, you must [request them here](https://developers.wrike.com/getting-started/).

[Wrike API 3.0 Documentation](https://developers.wrike.com/documentation-v3/api/overview)
[Wrike API 4.0 Documentation](https://developers.wrike.com/documentation/api/overview)
[Wrike migration from API v3 to API v4 Documentation](https://developers.wrike.com/documentation/api/migrations)

## TODO

- Tests

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Jpuelpan/omniauth-wrike
