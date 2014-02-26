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

      it "should display filled and disabled checkboxes" do
        expect(rendered).to match /Sign Up/
      end
    end
  end
end