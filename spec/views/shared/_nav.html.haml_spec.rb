require "rails_helper"

describe "navbar" do
  before(:all) do
    User.delete_all
  end

  describe "rendering navbar" do
    describe "with no users" do
      it "should display signup link" do
        render :partial => "shared/nav.html.haml"

        expect(rendered).to match /Sign Up/
      end
    end

    describe "with one user" do
      let(:user) {build :user, signup: true}

      it "should display signin link" do
        user.save

        render :partial => "shared/nav.html.haml"

        expect(rendered).to match /Sign In/
      end
    end

  end
end