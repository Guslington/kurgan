require 'kurgan/init'

module Kurgan
  class Ecs < Kurgan::Init

    class_option :components, :type => :array, :default => [
      { name: 'vpc', template: 'vpc'},
      { name: 'bastion', template: 'bastion'},
      { name: 'loadbalancer', template: 'loadbalancer'},
      { name: 'ecs', template: 'ecs'}
    ]

  end
end
