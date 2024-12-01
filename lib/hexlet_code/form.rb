# frozen_string_literal: true

module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :Input, 'hexlet_code/input'
  class Form
    def self.build(entity, **attributes)
      default_attributes = { action: attributes.delete(:url) || '#', method: 'post' }
      Tag.build('form', **default_attributes.merge(attributes)) do
        form_builder = FormBuilder.new(entity)
        yield form_builder
        form_builder.to_s # Convert fields to a string
      end
    end

    class FormBuilder
      def initialize(entity)
        @entity = entity
        @fields = []
      end

      def input(name, as: :input, **attributes)
        raise NoMethodError, "undefined method `#{name}` for #{@entity}" unless @entity.respond_to?(name)

        @fields << if as == :text
                     Tag.build('textarea', name: name, cols: 20, rows: 40, **attributes)
                   else
                     Input.build(name: name, **attributes)
                   end
      end

      def to_s
        @fields.join
      end
    end
  end
end
