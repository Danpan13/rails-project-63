# frozen_string_literal: true

require_relative 'hexlet_code/version'

# HexletCode module provides methods for generating HTML tags and forms.
module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :Form, 'hexlet_code/form'
  class Error < StandardError; end

  def self.form_for(_entity, **attributes)
    Form.build(**attributes)
  end
end
