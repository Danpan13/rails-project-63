# frozen_string_literal: true

# HexletCode module provides functionality for building HTML forms.
module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :Input, 'hexlet_code/input'
  autoload :Textarea, 'hexlet_code/textarea'
  autoload :Submit, 'hexlet_code/submit'
  # Form class represents an HTML form and provides methods to build it.
  class Form
    def self.build(entity, **attributes)
      default_attributes = { action: attributes.delete(:url) || '#', method: 'post' }
      Tag.build('form', **default_attributes, **attributes) do
        form_builder = FormBuilder.new(entity)
        yield form_builder
        form_builder.to_s # Convert fields to a string
      end
    end

    # FormBuilder class assists in building form fields.
    class FormBuilder
      def initialize(entity)
        @entity = entity
        @fields = []
      end

      def input(name, as: :input, **attributes)
        raise NoMethodError, "undefined method `#{name}` for #{@entity}" unless @entity.respond_to?(name)

        hash = @entity.to_h
        value = hash[name]
        @fields << if as == :text
                     Textarea.build(name: name, value: value, **attributes)
                   else
                     Input.build(name: name, value: value, **attributes)
                   end
      end

      def submit(text = 'Save')
        @fields << Submit.build(text)
      end

      def to_s
        @fields.join
      end
    end
  end
end
