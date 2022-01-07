module BulmaFormBuilder
  module Inputs
    module Submit
      extend ActiveSupport::Concern

      include Base

      included do
        def submit_with_bulma(value = nil, options = {})
          if value.is_a?(Hash)
            options = value
            value = nil
          end
          options[:class] = options[:class].present? ? Array(options[:class]) : []
          options[:class] += [:button, :'is-primary']
          field_control { submit_without_bulma(value, options) }
        end

        bulma_alias :submit
      end
    end
  end
end
