# frozen_string_literal: true

module HexletCode
  # Textarea class provides methods to build textarea elements for forms.
  class Textarea
    def self.build(name:, value: '', **attributes)
      default_attributes = { name: name, cols: 20, rows: 40 }
      label = Tag.build('label', for: name) { name.capitalize }
      input = Tag.build('textarea', **default_attributes.merge(attributes)) { value }
      label + input
    end
  end
end
