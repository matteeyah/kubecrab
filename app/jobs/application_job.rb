class ApplicationJob < ActiveJob::Base
  attr_reader :crab_id, :user_id, :options, :template

  def crab_init(crab)
    @crab_id = crab.id
    @user_id = crab.user.id
    @options = crab.options
    @tempfile = Tempfile.new
    @template = @tempfile.path
    @tempfile.write(ERB.new(crab.template.template).result(binding))
    @tempfile.close
  end

  def crab_cleanup
    @tempfile.unlink
  end
end
