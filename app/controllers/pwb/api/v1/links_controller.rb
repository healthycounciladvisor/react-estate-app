module Pwb
  class Api::V1::LinksController < ApplicationApiController
    def index
      # Globalize.fallbacks = {:ru => [:en]}
      # top_nav_links, footer_links = nil
      locale = params[:locale] || :en
      I18n.with_locale(locale) do
        top_nav_links = Link.ordered_top_nav
        footer_links = Link.ordered_footer
        render json: {
          footer_links: footer_links.as_json,
          top_nav_links: top_nav_links.as_json
        }
      end
    end

    def bulk_update
      link_groups_JSON = JSON.parse params[:linkGroups]
      # above gets me around difficulty of passing an array
      # as a param to rails (I've stringified json on clientside)
      # without above I'd have to get keys and loop through like so
      # link_groups = params[:linkGroups]
      # footer_links_keys = link_groups[:footer_links].keys
      # footer_links_keys.each do |footer_links_key|
      #   linkJSON = link_groups[:footer_links][footer_links_key]

      link_groups_JSON["top_nav_links"].each do |linkJSON|
        link = Link.find_by_slug linkJSON["slug"]
        link.update(linkJSON)
      end
      link_groups_JSON["footer_links"].each do |linkJSON|
        link = Link.find_by_slug linkJSON["slug"]
        link.update(linkJSON)
      end
      render json: {
        success: true
      }
    end

    private

    def links_params
      params.permit(:items, items: [])
    end
  end
end
