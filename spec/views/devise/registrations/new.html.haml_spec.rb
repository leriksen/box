require "spec_helper"

describe "devise/registrations/new.html.haml" do
  before(:all) do
    User.delete_all
  end

  describe "rendering checkboxes" do
    describe "with no users" do
      before do
        render
      end

      it "should display signup form" do
        expect(rendered).to match /Sign Up/
      end

      it "should display filled and disabled checkboxes" do
        expect(rendered).to have_css('input[type="checkbox"][checked="checked"][disabled="disabled"][value="admin"]')
        expect(rendered).to have_css('input[type="checkbox"][checked="checked"][disabled="disabled"][value="manager"]')
        expect(rendered).to have_css('input[type="checkbox"][checked="checked"][disabled="disabled"][value="staff"]')
      end
    end
  end
end