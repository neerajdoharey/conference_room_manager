class MailWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(user)
  end
end
