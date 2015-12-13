MRuby::Gem::Specification.new('mruby-gfmarkdown') do |spec|
  spec.license= 'MIT'
  spec.authors= 'harasou'
  spec.version = '0.0.1'
  spec.add_dependency('mruby-polarssl')
  spec.add_dependency('mruby-httprequest')
  spec.add_dependency('mruby-json')
end
