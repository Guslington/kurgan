CfhighlanderTemplate do
  Name 'ecs'
  Description ""

  Parameters do
    ComponentParam 'Environment', 'dev', isGlobal: true
    ComponentParam 'EnvironmentType', 'development', allowedValues: ['development','production'], isGlobal: true
  end


end
