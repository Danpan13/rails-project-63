# frozen_string_literal: true

require 'hexlet_code'

RSpec.describe HexletCode do
  let(:user) { Struct.new(:name, :job, :gender, keyword_init: true).new(name: 'rob', gender: "m") }
  let(:default_form_output) { File.read('spec/fixtures/default_form_output.html', encoding: 'UTF-8').strip }
  let(:form_with_custom_url) { File.read('spec/fixtures/form_with_custom_url.html', encoding: 'UTF-8').strip }
  let(:form_with_css_classes) { File.read('spec/fixtures/form_with_css_classes.html', encoding: 'UTF-8').strip }
  let(:form_with_textarea) { File.read('spec/fixtures/form_with_textarea.html', encoding: 'UTF-8').strip }
  let(:form_with_custom_attributes) { File.read('spec/fixtures/form_with_custom_attributes.html', encoding: 'UTF-8').strip }

  it 'generates an empty form' do
    expect(HexletCode.form_for(user)).to eq(default_form_output)
  end

  it 'generates a form with a custom URL' do
    expect(HexletCode.form_for(user, url: '/profile')).to eq(form_with_custom_url)
  end

  it 'generates a form with additional CSS classes' do
    expect(HexletCode.form_for(user, class: 'hexlet-form')).to eq(form_with_css_classes)
  end

  it 'generates a form with a textarea' do
    expect(HexletCode.form_for(user) { |f| f.input :job, as: :text }).to eq(form_with_textarea)
  end

  it 'generates a form with custom attributes' do
    expect(HexletCode.form_for(user, url: '#') { |f| f.input :job, as: :text, rows: 50, cols: 50 }).to eq(form_with_custom_attributes)
  end
end
