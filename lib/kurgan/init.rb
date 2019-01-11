require 'thor'

module Kurgan
  class Init < Thor::Group
    include Thor::Actions

    # Define arguments and options
    argument :name
    class_option :directory, :type => :string
    class_option :description, :type => :string
    class_option :parameters, :type => :array, :default => []
    class_option :components, :type => :array, :default => []

    def self.source_root
      File.dirname(__FILE__)
    end

    def set_directory
      @dir = options[:directory] ? options[:directory] : name
      empty_directory @dir
    end

    def create_cfhighlander_template
      opts = {parameters: options[:parameters], components: options[:components], description: options[:description]}
      template('templates/cfhighlander.rb.tt', "#{@dir}/#{name}.cfhighlander.rb", opts)
    end

    def create_config_yaml
      template('templates/config.yaml.tt', "#{@dir}/#{name}.config.yaml")
    end

    def git_init
      if yes?("git init project?")
        run("git init #{@dir}")
        template('templates/gitignore.tt', "#{@dir}/.gitignore")
        template('templates/README.md.tt', "#{@dir}/README.md")
      else
        say "Skipping git init", :yellow
      end
    end

  end
end
