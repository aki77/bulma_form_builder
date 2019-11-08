module BulmaFormBuilder
  module Inputs
    module TextArea
      extend ActiveSupport::Concern
      include Base

      included do
        def text_area_with_bulma(name, options = {})
          form_field_builder(name, options) do
            classes = [options[:class]]
            classes <<= 'textarea'
            classes <<= 'is-danger' if error?(name)
            options[:class] = classes.compact.join(' ')

            text_area_without_bulma(name, options)
          end
        end

        bulma_alias :text_area
      end
    end
  end
end
