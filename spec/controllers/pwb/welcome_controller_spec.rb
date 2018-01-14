require 'rails_helper'


module Pwb
  RSpec.describe WelcomeController, type: :controller do
    routes { Pwb::Engine.routes }

    before(:all) do
      @page = Pwb::Page.find_by_slug "home"
      unless @page.present?
        @page = FactoryGirl.create(:pwb_page, slug: "home")
      end
      # TODO: - figure out how to do below with FactoryGirl
      # @page.set_fragment_html "test", "en", "<h2>Sell Your Property with Us</h2>"
    end

    # This should return the minimal set of attributes required to create a valid
    # Welcome. As you add validations to Welcome, be sure to
    # adjust the attributes here as well.

    let(:carousel_content_attributes) do
      # skip("Add a hash of attributes valid for your model")
      {
        'tag' => 'landing-carousel'
      }
    end

    let(:invalid_attributes) do
      skip('Add a hash of attributes invalid for your model')
    end

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # WelcomesController. Be sure to keep this updated too.
    let(:valid_session) { {} }

    describe 'GET #index' do
      # it 'assigns all content_to_show correctly' do
      #   get :index, params: {}, session: valid_session
      #   expect(assigns(:content_to_show)).to eq([Content.where(page_part_key: "test").first.raw])
      # end
      it 'renders correct template' do
        # welcome = Content.create! carousel_content_attributes
        expect(get(:index)).to render_template('pwb/welcome/index')
      end
    end

    # describe "GET #show" do
    #   it "assigns the requested welcome as @welcome" do
    #     welcome = Welcome.create! carousel_content_attributes
    #     get :show, params: {id: welcome.to_param}, session: valid_session
    #     expect(assigns(:welcome)).to eq(welcome)
    #   end
    # end

    # describe "GET #new" do
    #   it "assigns a new welcome as @welcome" do
    #     get :new, params: {}, session: valid_session
    #     expect(assigns(:welcome)).to be_a_new(Welcome)
    #   end
    # end

    # describe "GET #edit" do
    #   it "assigns the requested welcome as @welcome" do
    #     welcome = Welcome.create! carousel_content_attributes
    #     get :edit, params: {id: welcome.to_param}, session: valid_session
    #     expect(assigns(:welcome)).to eq(welcome)
    #   end
    # end
    after(:all) do
      @page.destroy
    end
  end
end
