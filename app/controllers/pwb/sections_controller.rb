require_dependency 'pwb/application_controller'

module Pwb
  class SectionsController < ApplicationController

    # def sell
    #   # @agency = Agency.find_by_subdomain(request.subdomain.downcase)
    #   @enquiry = Message.new
    # end

    def about_us
      @content = Content.find_by_key("aboutUs")
      @page_title = I18n.t("aboutUs")
      @page_description = @content.present? ? @content.raw : ""
      # @page_keywords    = 'Site, Login, Members'
      # @about_us_image_url = Content.get_photo_url_by_key("aboutUs")
      # @about_us_image_url = Content.find_by_key("aboutUs").content_photos.first.image_url || "http://moodleboard.com/images/prv/estate/estate-slider-bg-1.jpg"
      return render "/pwb/sections/about_us"
    end

    def privacy_policy
      @title_key = "privacyPolicy"
      @page_title = I18n.t("privacyPolicy")
      @content = Content.find_by_key("privacyPolicy") || OpenStruct.new
      return render "/pwb/sections/static"
    end

    def legal
      @title_key = "legalAdvice"
      @page_title = I18n.t("legalAdvice")
      @content = Content.find_by_key("legalAdvice") || OpenStruct.new
      return render "/pwb/sections/static"
    end


    def contact_us
      # below for google map rendering via paloma:
      js :current_agency_primary_address => @current_agency.primary_address
      js :show_contact_map => @current_agency.show_contact_map
      # could explicitly set function for Paloma to use like so:
      # js "Pwb/Sections#contact_us"
      # @enquiry = Message.new
      @page_title = I18n.t("contactUs")

      return render "/pwb/sections/contact_us"
    end

    def contact_us_ajax
      @error_messages = []
      I18n.locale = params["contact"]["locale"] || I18n.default_locale
      # have a hidden field in form to pass in above
      # @enquiry = Message.new(params[:contact])

      @client = Client.find_or_initialize_by(email: params[:contact][:email])
      @client.attributes = {
        phone_number_primary: params[:contact][:tel],
        first_names: params[:contact][:name],
      }

      @enquiry = Message.new(
        {
          title: params[:contact][:subject],
          content: params[:contact][:message],
          locale: params[:contact][:locale],
          url: request.referer,
          host: request.host,
          origin_ip: request.ip,
          user_agent: request.user_agent,
          delivery_email: @current_agency.email_for_general_contact_form
          # origin_email: params[:contact][:email]
      })
      unless @enquiry.save && @client.save
        @error_messages = @error_messages + @client.errors.full_messages
        @error_messages = @error_messages + @enquiry.errors.full_messages
        return render "pwb/ajax/contact_us_errors"
      end

      unless @current_agency.email_for_general_contact_form.present?
        # in case a delivery email has not been set
        @enquiry.delivery_email = "no_delivery_email@propertywebbuilder.com"
      end

      @enquiry.client = @client
      @enquiry.save

      # @enquiry.delivery_email = ""
      EnquiryMailer.general_enquiry_targeting_agency(@client, @enquiry).deliver_now

      # @enquiry.delivery_success = true
      # @enquiry.save

      @flash = I18n.t "contact.success"
      return render "pwb/ajax/contact_us_success", layout: false
    rescue => e
      # TODO - log error to logger....
      # flash.now[:error] = 'Cannot send message.'
      @error_messages = [ I18n.t("contact.error"), e ]
      return render "pwb/ajax/contact_us_errors", layout: false
    end


  end
end
