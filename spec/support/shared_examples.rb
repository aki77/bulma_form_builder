RSpec.shared_examples 'a labelled field' do
  it 'has a label and control div inside a field div' do
    expect(subject).to have_tag('div', with: { class: 'field'}) do
      with_tag 'label', with: { class: 'label' }
      with_tag 'div', with: { class: 'control' }
    end
  end
end

RSpec.shared_examples 'an unlabelled field' do
  it { expect(subject).not_to have_tag('label') }
end
