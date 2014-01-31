require 'spec_helper'

describe User do
  context :create do
    it 'can create a user' do
      user = build :user
      $stderr.puts "#{Time.now} - #{__method__} - user == #{user.inspect}"
      user.email.should match(/example[.]com/) 
    end
  end
end
