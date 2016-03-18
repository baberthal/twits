clearing :on
notification :gntp

rspec_opts = {
  cmd: 'bundle exec rspec',
  all_on_start: true,
  all_after_pass: false,
}

guard :rspec, rspec_opts do
  require 'guard/rspec/dsl'
  dsl = Guard::RSpec::Dsl.new(self)

  # RSpec files
  rspec = dsl.rspec
  watch(rspec.spec_helper) { rspec.spec_dir }
  watch(rspec.spec_support) { rspec.spec_dir }
  watch(rspec.spec_files)

  # Ruby files
  ruby = dsl.ruby
  dsl.watch_spec_files_for(ruby.lib_files)
end

#  vim: set ts=8 sw=2 tw=0 ft=ruby et :
