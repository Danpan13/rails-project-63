# frozen_string_literal: true

module HexletCode
  # HexletCode::Tag module provides methods for building HTML tags.
  module Tag
    def self.build(name, **attributes)

      if block_given?
        "\n<#{name}#{attributes_string(attributes)}>#{yield}</#{name}>"
      else
        "\n<#{name}#{attributes_string(attributes)} />"
      end
    end

    private

    def self.attributes_string(attributes)
      attributes.map { |key, value| " #{key}=\"#{value}\"" }.join
    end
  end
end
