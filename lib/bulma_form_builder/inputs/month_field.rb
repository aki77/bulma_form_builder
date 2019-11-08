module BulmaFormBuilder
  module Inputs
    module MonthField
      extend ActiveSupport::Concern

      include Base

      included do
        def month_field_with_bulma(name, options = {})
          form_field_builder(name, options) do
            classes = [options[:class]]
            classes <<= 'input'
            classes <<= 'is-danger' if error?(name)
            options[:class] = classes.compact.join(' ')

            # NOTE: month_fieldの場合だけこれがないと初期値が入らないので
            options[:value] = object.public_send(name)

            month_field_without_bulma(name, options)
          end
        end

        bulma_alias :month_field
      end
    end
  end
end
