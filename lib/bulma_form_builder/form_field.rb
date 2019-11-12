module BulmaFormBuilder
  module FormField
    extend ActiveSupport::Concern

    def form_field(*args, &block)
      name = args.first
      options = args.extract_options!

      content_tag(:div, class: form_field_classes(options)) do
        concat field_label(name, options) unless options[:hide_label]
        concat field_control(&block)
        concat field_help(name, options)
      end
    end

    private

    def field_control(&block)
      content_tag(:div, class: 'control', &block)
    end

    def field_help(name, options)
      if error?(name)
        content_tag(:p, error_messages_for(name), class: 'help is-danger')
      elsif options[:help].present?
        content_tag(:p, options[:help], class: 'help')
      end
    end

    def field_label(name, options)
      classes = %w[label]
      classes << 'required' if options[:required]
      label(name, options[:label], class: classes)
    end

    def form_field_classes(options)
      classes = %w[field]
      classes << options.delete(:wrapper_class) if options[:wrapper_class].present?
      classes
    end
  end
end
