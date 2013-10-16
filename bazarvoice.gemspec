# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{bazarvoice}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sapna Jadon"]
  s.date = %q{2013-10-16}
  s.description = %q{This adds bazarvoice support to your Rails application
      including single sign-on.}  
  s.extra_rdoc_files = [
    "CHANGELOG.rdoc",
     "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "CHANGELOG.rdoc",
     "LICENSE",
     "README.rdoc",
     "generators/bazarvoice/USAGE",
     "generators/bazarvoice/templates/bazarvoice_template.yml",
     "generators/bazarvoice/bazarvoice_generator.rb",
     "init.rb",
     "lib/bazarvoice.rb",
     "lib/bazarvoice/instance_methods.rb",
     "lib/bazarvoice/token.rb",
     "lib/bazarvoice/view_helpers.rb",     
     "bazarvoice.gemspec"
  ]
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{bazarvoice for your Rails application}
  
  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ezcrypto>, [">= 0.7.2"])
      s.add_runtime_dependency(%q<activesupport>, [">= 2.1"])
      s.add_runtime_dependency(%q<actionpack>, [">= 2.1"])
      s.add_runtime_dependency(%q<rails>, [">= 2.1"])
    else
      s.add_dependency(%q<ezcrypto>, [">= 0.7.2"])
      s.add_dependency(%q<activesupport>, [">= 2.1"])
      s.add_dependency(%q<actionpack>, [">= 2.1"])
      s.add_dependency(%q<rails>, [">= 2.1"])
    end
  else
    s.add_dependency(%q<ezcrypto>, [">= 0.7.2"])
    s.add_dependency(%q<activesupport>, [">= 2.1"])
    s.add_dependency(%q<actionpack>, [">= 2.1"])
    s.add_dependency(%q<rails>, [">= 2.1"])
  end
end

