module BulmaFormBuilder
  module FormFieldBuilder
    extend ActiveSupport::Concern

    private

    def form_field_builder(method, options, _html_options = nil)
      form_field(method, options) { yield }
    end
  end
end
