# frozen_string_literal: true
module Infrastructure
  class EventBus
    def initialize(*listeners)
      @listeners = listeners
    end

    def handle(events)
      events.map do |event|
        @listeners.map do |listener|
          listener.handle event
        end
      end
    end
  end
end
