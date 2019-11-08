module BulmaFormBuilder
  module Inputs
    module TimeField
      extend ActiveSupport::Concern

      include Base

      included do
        def time_field_with_bulma(name, options = {})
          form_field_builder(name, options) do
            classes = [options[:class]]
            classes <<= 'input'
            classes <<= 'is-danger' if error?(name)
            options[:class] = classes.compact.join(' ')

            time_field_without_bulma(name, options)
          end
        end

        bulma_alias :time_field
      end
    end
  end
end
