SAMPLE_URL = [
  'https://youtu.be/NLOp_6uPccQ',
  'https://youtu.be/VImYeXnr13Q',
  'https://youtu.be/XW2E2Fnh52w',
  'https://youtu.be/N73oTiIIJe0',
  'https://youtu.be/z6512XKKNkU'
]

FactoryBot.define do
  factory :video do
    url { SAMPLE_URL.sample }
  end
end
