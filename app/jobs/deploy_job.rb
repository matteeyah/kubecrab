class DeployJob < ApplicationJob
  queue_as :default

  def perform(crab)
    logger.info "Deployment starting for #{crab.name}"

    crab_init(crab)

    command = ERB.new(crab.template.engine.deploy_command).result(binding)
    output, status = Open3.capture2(command)

    logger.error output unless status.exitstatus.zero?

    crab_cleanup
  end
end
