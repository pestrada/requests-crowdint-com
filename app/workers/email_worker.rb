class EmailWorker
  include Sidekiq::Worker

  def perform(name, count)
    Notifier.new_request.deliver
  end
end
