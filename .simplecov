if ENV["COVERAGE"]
  SimpleCov.start 'rails' do
    add_filter do |src_file|
      File.basename(src_file.filename) =~ /_spec.rb/
    end
  end
end