require 'kurgan/init'

module Kurgan
  class Component < Kurgan::Init

    puts "here"

    class_option :parameters, :type => :array, :default => [
      {
        name: 'Environment',
        default: 'dev',
        options: 'isGlobal: true'
      },
      {
        name: 'EnvironmentType',
        default: 'development',
        options: "allowedValues: ['development','production'], isGlobal: true"
      }
    ]

    def set_directory
      @dir = options[:directory] ? options[:directory] : "hl-component-#{name}"
      empty_directory @dir
    end

    def create_cfndsl_template
      template('templates/cfndsl.rb.tt', "#{@dir}/#{name}.cfndsl.yaml")
    end

    def copy_licence
      if yes?("Use MIT license?")
        copy_file "templates/MITLICENSE", "#{@dir}/LICENSE"
      else
        say "Not creating a license", :yellow
      end
    end

    def create_travis_config
      if yes?("Use Travis-ci?")
        copy_file "templates/travis.yml.tt", "#{@dir}/travis-ci.yml"
      else
        say "skipping travis", :yellow
      end
    end

  end
end
