module BulmaFormBuilder
  module Inputs
    module Select
      extend ActiveSupport::Concern

      include Base

      included do
        def select_with_bulma(method, choices = nil, options = {}, html_options = {}, &block)
          html_options[:required] = options[:required]

          form_field_builder(method, options, html_options) do
            content_tag(:div, class: 'select') do
              select_without_bulma(method, choices, options, html_options, &block)
            end
          end
        end

        bulma_alias(:select)
      end
    end
  end
end
