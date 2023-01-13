require 'spec_helper'

describe OmniAuth::Strategies::Wrike do
  let(:request) { double('Request', params: {}, cookies: {}, env: {}) }
  let(:profile) { raw_info_hash['profiles'].first }

  subject do
    args = ['appid', 'secret', @options || {}].compact
    OmniAuth::Strategies::Wrike.new(*args).tap do |strategy|
      allow(strategy).to receive(:request) {
        request
      }
    end
  end

  describe 'client options' do
    it 'has correct name' do
      expect(subject.options.name).to eq('wrike')
    end

    it 'has correct site' do
      expect(subject.options.client_options.site).to eq('https://www.wrike.com/api/v4')
    end

    it 'has correct authorize url' do
      expect(subject.options.client_options.authorize_url).to eq('https://www.wrike.com/oauth2/authorize/v4')
    end
  end

  describe 'info' do
    before do
      allow(subject).to receive(:raw_info).and_return(raw_info_hash)
    end

    it 'contains strict list of attrs' do
      expect(subject.info.keys).to contain_exactly(:uid, :name, :email)
    end

    it 'returns the uid' do
      expect(subject.info[:uid]).to eq(raw_info_hash['id'])
    end

    it 'returns the name' do
      expect(subject.info[:name]).to eq("#{raw_info_hash['firstName']} #{raw_info_hash['lastName']}")
    end

    it 'returns the email' do
      expect(subject.info[:email]).to eq(profile['email'])
    end
  end

  describe 'user_email' do
    before do
      allow(subject).to receive(:raw_info).and_return(raw_info_hash)
    end

    it 'returns user email from first profile' do
      expect(subject.user_email).to eq(profile['email'])
    end
  end

  describe 'request_phase' do
    context 'with a specified callback_url in the params' do
      before do
        params = { 'callback_url' => 'http://foo.dev/auth/wrike/foobar' }
        allow(subject).to receive(:request) do
          double('Request', params: params)
        end
        allow(subject).to receive(:session) do
          double('Session', :[] => { 'callback_url' => params['callback_url'] })
        end
      end

      it 'returns the correct callback_path' do
        expect(subject.callback_path).to eq '/auth/wrike/callback'
      end
    end

    context 'with no callback_url set' do
      it 'returns the default callback_path value' do
        expect(subject.callback_path).to eq '/auth/wrike/callback'
      end
    end
  end
end

private

def raw_info_hash
  {
    "id" => "KUAJ25LC",
    "firstName" => "Test",
    "lastName" => "User",
    "type" => "Person",
    "profiles" => [
      {
        "accountId" => "IEAGIITR",
        "email" => "test.user@myapp.com",
        "role" => "User",
        "external" => false,
        "admin" => false,
        "owner" => true
      }
    ],
    "avatarUrl" => "https://www.wrike.com/avatars//7E/A2/Box_ffdf2a2e_84-84_v1.png",
    "timezone" => "Europe/Moscow",
    "locale" => "en",
    "deleted" => false,
    "me" => true
  }
end
