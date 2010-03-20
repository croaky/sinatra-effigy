class JobView < Effigy::View
  attr_reader :job

  def initialize(job)
    @job = job
  end

  def transform
    f('title').text("#{job.position} at #{job.company}")
  end
end
