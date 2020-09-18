require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe 'GET #show' do
    before { get :index }

    it { should render_template('welcome') }
  end
end
