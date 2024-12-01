# frozen_string_literal: true

require 'hexlet_code'

RSpec.describe HexletCode do
  let(:user) { Struct.new(:name, :job, keyword_init: true).new(name: 'rob') }

  it 'generates an empty form' do
    expect(HexletCode.form_for(user)).to eq('<form action="#" method="post"></form>')
  end

  it 'generates a form with additional attributes' do
    expect(HexletCode.form_for(user,
                               class: 'hexlet-form')).to eq('<form action="#" method="post" class="hexlet-form"></form>')
  end

  it 'uses url attribute if provided' do
    expect(HexletCode.form_for(user, url: '/profile',
                                     class: 'hexlet-form')).to eq('<form action="/profile" method="post" class="hexlet-form"></form>')
  end
end
