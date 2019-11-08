module BulmaFormBuilder
  module Components
    module Validation
      extend ActiveSupport::Concern

      private

      def error?(name)
        object.respond_to?(:errors) && !(name.nil? || object.errors[name].empty?)
      end

      def error_messages_for(name)
        object.errors.full_messages_for(name).join("\n")
      end
    end
  end
end
