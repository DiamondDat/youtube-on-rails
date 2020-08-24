require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) { create :user, username: 'greed', password: '123456' }

  describe 'POST #access' do
    context 'when user signup successfully' do
      subject { post :access, params: { user: { username: 'wrath', password: '123456' } } }

      it { expect { subject }.to change(User, :count).by(1) }

      it do
        is_expected
        expect(response.code).to eq '302'
        expect(flash[:success]).to be_truthy
        expect(subject).to redirect_to root_path
      end
    end

    context 'when user signin successfully' do
      subject { post :access, params: { user: { username: 'greed', password: '123456' } } }

      it do
        is_expected
        expect(response.code).to eq '302'
        expect(flash[:success]).to be_truthy
        expect(subject).to redirect_to root_path
      end
    end

    context 'when user signin failed' do
      subject { post :access, params: { user: { username: 'greed', password: '12345678' } } }

      it do
        is_expected
        expect(response.code).to eq '302'
        expect(flash[:error]).to be_truthy
        expect(subject).to redirect_to root_path
      end
    end
  end
end
