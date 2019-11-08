module BulmaFormBuilder
  module Helpers
    def alert_message(options = {})
      title = options[:title] || I18n.t('errors.messages.alert')
      css = options[:class] || 'notification is-danger'
      return unless object.respond_to?(:errors) && object.errors.full_messages.any?

      content_tag :div, class: css do
        concat content_tag :p, title
        concat error_summary unless options[:error_summary] == false
      end
    end

    def error_summary
      return unless object.errors.any?

      content_tag :ul, class: 'error-summary' do
        object.errors.full_messages.each do |error|
          concat content_tag(:li, error)
        end
      end
    end
  end
end
