module BulmaFormBuilder
  module Inputs
    module CheckBox
      extend ActiveSupport::Concern

      include Base

      included do
        def check_box_with_bulma(name, options = {}, checked_value = '1', unchecked_value = '0', &block)
          options = options.symbolize_keys!
          check_box_options = options.except(:class, :label, :label_class, :error_message, :help, :inline, :custom, :hide_label, :skip_label, :wrapper_class)

          content_tag(:div, class: 'field') do
            content_tag(:label, class: 'checkbox') do
              html = check_box_without_bulma(name, check_box_options, checked_value, unchecked_value)
              html.concat(check_box_label(name)) unless options[:skip_label]
              html.concat(generate_error(name)) if options[:error_message]
              html
            end
          end
        end

        bulma_alias(:check_box)
      end

      private

      def check_box_label(name)
        content_tag(:span, object.class.human_attribute_name(name), class: 'control-label')
      end
    end
  end
end
