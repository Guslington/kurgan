require "thor"
require "kurgan/version"
require "kurgan/init"
require "kurgan/component"

require "kurgan/projects/ecs"

module Kurgan
  class Cli < Thor

    map %w[--version -v] => :__print_version
    desc "--version, -v", "print the version"
    def __print_version
      puts Kurgan::VERSION
    end

    # Generats new projects
    register Kurgan::Init, 'project', 'name', 'Generates a new CfHighalnder project'
    register Kurgan::Ecs, 'ecs', 'name', 'Generates a new CfHighalnder ECS project'

    # Generates new components
    register Kurgan::Component, 'component', 'name', 'Generates a new CfHighalnder component'

  end
end
