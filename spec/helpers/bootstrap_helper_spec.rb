require 'spec_helper'

describe BootstrapHelper do
  it 'returns nothing for empty flashes' do
    expect(helper.flash_map).to be_empty
  end

  it 'can format a single known flash message' do
    expect(helper.flash_map(notice: 'here')).to eq('<div class="alert alert-success" data-alert="">here<a class="close" href="#">&amp;times;</a></div>')
  end
  
  it 'can format multiple known flash messages' do
    expect(helper.flash_map(notice: 'here', error: 'there')).to eq('<div class="alert alert-success" data-alert="">here<a class="close" href="#">&amp;times;</a></div><div class="alert alert-danger" data-alert="">there<a class="close" href="#">&amp;times;</a></div>')
  end
end