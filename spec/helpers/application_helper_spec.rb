require 'rails_helper'

describe ApplicationHelper do
  it 'returns name from econfig' do
    expect(Box.config.site_name).to eq("KennelBox")
  end
end