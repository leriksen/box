require 'spec_helper'

describe FoundationHelper do
  it 'returns nothing for empty flashes' do
    expect(helper.flash_map).to be_empty
  end

  it 'can format a single known flash message' do
    expect(helper.flash_map(notice: 'here')).to eq('<div class="alert-box radius success" data-alert="">here<a class="close" href="#">&amp;times;</a></div>')
  end
  
  it 'can format multiple known flash messages' do
    expect(helper.flash_map(notice: 'here', error: 'there')).to eq('<div class="alert-box radius success" data-alert="">here<a class="close" href="#">&amp;times;</a></div><div class="alert-box radius alert" data-alert="">there<a class="close" href="#">&amp;times;</a></div>')
  end
end