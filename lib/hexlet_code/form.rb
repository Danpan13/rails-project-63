module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  class Form
    def self.build(**attributes)
      default_attributes = { action: attributes.delete(:url) || '#', method: 'post' }
      Tag.build('form', **default_attributes.merge(attributes))
    end
  end
end
