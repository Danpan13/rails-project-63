# frozen_string_literal: true

require_relative 'hexlet_code/version'

# HexletCode module provides methods for generating HTML tags and forms.
module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  class Error < StandardError; end

  def self.form_for(entity, **attributes)
    action = attributes.delete(:url) || "#"
    attributes_string = attributes.map { |key, value| " #{key}=\"#{value}\"" }.join
    "<form action=\"#{action}\" method=\"post\"#{attributes_string}></form>"
  end
end
