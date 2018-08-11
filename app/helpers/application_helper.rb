module ApplicationHelper
  def set_interval(delay)
    mutex = Mutex.new
    Thread.new() do
      mutex.synchronize do
        Rails.application.executor.wrap do
          loop do
            sleep delay
            yield
          end
        end
      end
    end
  end
end
