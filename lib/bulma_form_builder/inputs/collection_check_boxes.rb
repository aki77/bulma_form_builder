module BulmaFormBuilder
  module Inputs
    module CollectionCheckBoxes
      extend ActiveSupport::Concern
      include Base

      included do
        def collection_check_boxes_with_bulma(method, collection, value_method, text_method, options = {}, html_options = {}) # rubocop:disable Metrics/ParameterLists
          html = form_field_builder(method, options, html_options) do
            collection_check_boxes_without_bulma(method, collection, value_method, text_method, options, html_options) do |b|
              content_tag(:label, class: 'checkbox') do
                concat b.check_box
                concat content_tag(:span, class: 'control-label') { b.text }
              end
            end
          end
          hidden_field(method, value: '', multiple: true).concat(html)
        end

        bulma_alias :collection_check_boxes
      end
    end
  end
end
