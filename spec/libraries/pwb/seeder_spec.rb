require 'spec_helper'
require 'pwb/seeder'

module Pwb
  RSpec.describe 'Seeder' do
    before(:all) do
      I18n::Backend::ActiveRecord::Translation.destroy_all
      Pwb::Seeder.seed!
    end

    it 'creates i18n translations' do
      es_translations = I18n::Backend::ActiveRecord::Translation.where(locale: "es")
      en_translations = I18n::Backend::ActiveRecord::Translation.where(locale: "en")
      expect(es_translations.count).to eq(en_translations.count)
      expect(es_translations.count).to be > 0
    end

    # it 'creates a landing page hero entry' do
    #   expect(Pwb::Content.find_by_key('landingCarousel1')).to be_present
    # end

    # it 'creates an about_us entry' do
    #   expect(Pwb::Content.find_by_key('aboutUs')).to be_present
    # end

    # it 'creates 3 content-area-cols' do
    #   expect(Pwb::Content.where(tag: 'content-area-cols').count).to eq(3)
    # end

    it 'creates 2 Users' do
      expect(Pwb::User.count).to eq(2)
    end

    it 'creates 6 prop entries' do
      expect(Pwb::Prop.count).to eq(6)
    end

    # Db is cleaned after each test in spec_helper
    # after(:all) do
    #   DatabaseCleaner.clean_with(:truncation)
    # end
  end
end
