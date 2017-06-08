require 'faraday'

module Pwb
  class Import::ScrapperController < ApplicationApiController
    def from_webpage
      # just a proof of concept at this stage
      unless params[:url].present?
        return render json: { error: "Please provide url."}, status: 422
      end

      target_url = params[:url]

      retrieved_properties = Pwb::SiteScrapper.new(target_url).retrieve_from_webpage

      render json: retrieved_properties
    end

    def from_api
      unless params[:url].present?
        return render json: { error: "Please provide url."}, status: 422
      end
      target_url = params[:url]
      # "https://propertywebbuilder.herokuapp.com"

      retrieved_properties = Pwb::SiteScrapper.new(target_url).retrieve_from_api

      render json: retrieved_properties
    end
  end
end
