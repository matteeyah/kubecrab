class DestroyJob < ApplicationJob
  queue_as :default

  def perform(crab)
    logger.info "Deleting #{crab.name}"

    crab_init(crab)

    command = ERB.new(crab.template.engine.destroy_command).result(binding)
    output, status = Open3.capture2(command)

    logger.error output unless status.exitstatus.zero?

    crab_cleanup

    crab.destroy! if status.exitstatus.zero?
  end
end
