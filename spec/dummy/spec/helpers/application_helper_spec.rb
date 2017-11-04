require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe "#releasable?" do
    subject { releasable?(key, user) }

    let(:release) { create(:release, user_ids: white_list_user_ids) }
    let(:white_list_user_ids) { "1,2,3,4" }
    let(:key) { release.key }
    let(:user) { double(:user) }

    context "when key is not provide" do
      let(:key) { nil }

      it { is_expected.to be_falsy }
    end

    context "when user is not provide" do
      let(:user) { nil }

      it { is_expected.to be_falsy }
    end

    context "when user does not have an ID" do
      it { expect { subject }.to raise_error(Releasable::ReleasableError) }
    end

    context "when user is a white-list user" do
      let(:user) { double(:user, id: 1) }

      it { is_expected.to be_truthy }
    end

    context "when user is not a white-list user" do
      let(:user) { double(:user, id: 5) }

      it { is_expected.to be_falsy }
    end

    context "when release is marked as releasing for all users" do
      let(:release) { create(:release, user_ids: white_list_user_ids, release_all: true) }

      it { is_expected.to be_truthy }
    end
  end
end

