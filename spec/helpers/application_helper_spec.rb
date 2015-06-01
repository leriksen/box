require 'rails_helper'

describe ApplicationHelper do
  it 'returns name from econfig' do
    expect(Box.site_name).to eq("KennelBox")
  end
end