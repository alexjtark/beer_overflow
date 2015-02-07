require 'rails_helper'

describe QuestionsController do
  describe 'GET #index' do
    it 'renders the question index page' do
      get :index
      expect(response).to render_template :index
    end
  end


end

