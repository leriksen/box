require 'rails_helper'

describe BootstrapHelper do
  it 'returns nothing for empty flashes' do
    expect(helper.flash_map).to be_empty
  end

  it 'can format a single known flash message' do
    expect(helper.flash_map(notice: 'here')).to eq('<div class="alert alert-success alert-dismissable" data-alert="">here<button name="button" type="submit" class="close" data-dismiss="alert" aria-hidden="true">&amp;times;</button></div>')
  end
  
  it 'can format multiple known flash messages' do
    expect(helper.flash_map(notice: 'here', error: 'there')).to eq('<div class="alert alert-success alert-dismissable" data-alert="">here<button name="button" type="submit" class="close" data-dismiss="alert" aria-hidden="true">&amp;times;</button></div><div class="alert alert-danger alert-dismissable" data-alert="">there<button name="button" type="submit" class="close" data-dismiss="alert" aria-hidden="true">&amp;times;</button></div>')
  end
end
