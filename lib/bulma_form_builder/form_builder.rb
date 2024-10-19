require 'bulma_form_builder/form_field_builder'
require 'bulma_form_builder/form_field'
require 'bulma_form_builder/components'
require 'bulma_form_builder/helpers'
require 'bulma_form_builder/inputs'

module BulmaFormBuilder
  class FormBuilder < ActionView::Helpers::FormBuilder
    attr_reader :layout

    include BulmaFormBuilder::FormFieldBuilder
    include BulmaFormBuilder::FormField
    include BulmaFormBuilder::Components

    include BulmaFormBuilder::Helpers

    include BulmaFormBuilder::Inputs::Base
    include BulmaFormBuilder::Inputs::EmailField
    include BulmaFormBuilder::Inputs::UrlField
    include BulmaFormBuilder::Inputs::DateField
    include BulmaFormBuilder::Inputs::TimeField
    include BulmaFormBuilder::Inputs::MonthField
    include BulmaFormBuilder::Inputs::NumberField
    include BulmaFormBuilder::Inputs::PasswordField
    include BulmaFormBuilder::Inputs::Select
    include BulmaFormBuilder::Inputs::Submit
    include BulmaFormBuilder::Inputs::TextField
    include BulmaFormBuilder::Inputs::TextArea
    include BulmaFormBuilder::Inputs::CheckBox
    include BulmaFormBuilder::Inputs::CollectionCheckBoxes
    include BulmaFormBuilder::Inputs::CollectionRadioButtons

    delegate :content_tag, :capture, :concat, :tag, to: :@template

    def initialize(object_name, object, template, options)
      @layout = options[:layout]
      super
    end
  end
end
