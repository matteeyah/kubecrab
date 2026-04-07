module ActionView
  module Helpers
    class ActionView::Helpers::FormBuilder
      def error_message(method)
        return unless object.respond_to?(:errors)
        return unless object.errors.include?(method)

        @template.tag.p class: "mt-2 text-sm text-red-600 dark:text-red-400", id: "#{field_id(method)}_errors" do
          object.errors.full_messages_for(method).to_sentence
        end
      end
    end
  end
end
