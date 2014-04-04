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
        expect(rendered).to have_css("input[type='checkbox'][disabled='disabled'][checked='checked'][id='user_roles_'][value='admin']")
        expect(rendered).to have_css("input[type='checkbox'][disabled='disabled'][checked='checked'][id='user_roles_'][value='staff']")
        expect(rendered).to have_css("input[type='checkbox'][disabled='disabled'][checked='checked'][id='user_roles_'][value='manager']")
        expect(rendered).to have_css("input[type='checkbox'][disabled='disabled'][id='user_roles_'][value='customer']")
      end
    end
  end
end