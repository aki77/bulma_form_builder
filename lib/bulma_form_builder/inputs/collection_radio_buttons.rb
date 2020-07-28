module BulmaFormBuilder
  module Inputs
    module CollectionRadioButtons
      extend ActiveSupport::Concern
      include Base

      included do
        def collection_radio_buttons_with_bulma(method, collection, value_method, text_method, options = {}, html_options = {}) # rubocop:disable Metrics/ParameterLists
          html = form_field_builder(method, options, html_options) do
            collection_radio_buttons_without_bulma(method, collection, value_method, text_method, options, html_options) do |b|
              content_tag(:label, class: 'radio') do
                concat b.radio_button
                concat content_tag(:span, class: 'control-label') { b.text }
              end
            end
          end
        end

        bulma_alias :collection_radio_buttons
      end
    end
  end
end
