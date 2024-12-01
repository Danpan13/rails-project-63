module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :Input, 'hexlet_code/input'
  class Form
    def self.build(entity, **attributes, &block)
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

        field_value = @entity.public_send(name)
        if as == :text
          @fields << Tag.build('textarea', name: name, cols: 20, rows: 40, **attributes) { field_value }
        else
          @fields << Input.build(name: name, value: field_value, **attributes)
        end
      end

      def to_s
        @fields.join
      end
    end
  end
end
