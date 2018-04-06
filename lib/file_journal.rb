require "yaml"
require_relative "editable"

class FileJournal
  attr_accessor :entries

  include Editable

  def initialize
    @entries = []

    if File.exists?("journal_data.yaml")
      @entries = YAML.load_file("journal_data.yaml") || []
    else
      File.new("journal_data.yaml", "w")
    end
  end

  def quit
    File.open("journal_data.yaml", "w") do |j|
      j.write(@entries.to_yaml)
      j.close
    end
  end
end
