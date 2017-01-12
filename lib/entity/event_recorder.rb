# frozen_string_literal: true
module Entity
  module EventRecorder
    attr_accessor :events

    def recorded_events
      @events
    end

    def record(event)
      @events = [] if @events.nil?
      @events << event
    end
  end
end
