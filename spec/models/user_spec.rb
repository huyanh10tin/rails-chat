require 'rails_helper'

RSpec.describe User, type: :model do
  let(:loi) {User.create name: "Loi", email: "loi@coderschool.vn"}
  let(:tai) {User.create name: "Tai", email: "tai@coderschool.vn"}

    describe "User model" do
      it "titleizes name" do
        expect(loi.titleize_name).to eq "Loi"
      end

      it "has default image" do
        expect(loi.image_url_or_default).to eq "http://lorempixel.com/128/128/sports/Fake-User/"
      end
    end
end
