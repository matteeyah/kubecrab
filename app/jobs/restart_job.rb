class RestartJob < ApplicationJob
  queue_as :default

  def perform(crab)
    logger.info "Restarting #{crab.name}"

    crab_init(crab)

    command = ERB.new(crab.template.engine.restart_command).result(binding)
    output, status = Open3.capture2(command)

    logger.error output unless status.exitstatus.zero?

    crab_cleanup
  end
end
