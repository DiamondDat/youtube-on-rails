require 'rails_helper'

RSpec.describe VideosController, type: :controller do
  let!(:user) { create :user }

  before { authenticate_user(user) }

  describe 'GET #index' do
    let!(:videos) { create :video, user: user }

    before { authenticate_user(user) }

    context 'render video index page' do
      subject { get :index }

      it do
        is_expected
        expect(response.code).to eq '200'
        expect(subject).to render_template(:index)
        expect(assigns(:videos).size).to eq 1
      end
    end
  end

  describe 'GET #new' do
    context 'render new template' do
      subject { get :new }

      its(:code) { is_expected.to eq '200' }
      its(:body) { is_expected.to render_template(:new) }
    end
  end

  describe 'POST #create' do
    let!(:video) { create :video, user: user, url: SAMPLE_URL[1] }

    context 'when video create successfully' do
      subject { post :create, params: { video: { url: SAMPLE_URL[2] } } }

      it { expect { subject }.to change(Video, :count).by(1) }

      it do
        is_expected
        expect(response.code).to eq '302'
        expect(flash[:success]).to be_truthy
        expect(subject).to redirect_to root_path
      end
    end

    context 'when video already exists' do
      subject { post :create, params: { video: { url: SAMPLE_URL[1] } } }

      it do
        is_expected
        expect(response.code).to eq '200'
        expect(flash[:alert]).to be_truthy
      end
    end

    context 'when video fail to create' do
      subject { post :create, params: { video: { url: 'youtube.com/123' } } }

      it { expect { subject }.to change(Video, :count).by(0) }

      it do
        is_expected
        expect(response.code).to eq '200'
        expect(flash[:alert]).to be_truthy
      end
    end
  end
end
