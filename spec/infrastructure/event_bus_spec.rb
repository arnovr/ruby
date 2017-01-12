# frozen_string_literal: true
require 'infrastructure/event_bus'

describe 'EventBus' do
  describe 'Handle one event' do
    it 'should handle an event correctly' do
      listener = double('listener')
      event = double('event')
      event_bus = Infrastructure::EventBus.new(
        listener
      )

      expect(listener).to receive(:handle).with(event)

      event_bus.handle(
        [event]
      )
    end
    it 'should handle multiple listeners for one event' do
      listener = double('listener')
      listener1 = double('listener')
      event = double('event')
      event_bus = Infrastructure::EventBus.new(
        listener,
        listener1
      )

      expect(listener).to receive(:handle).with(event)
      expect(listener1).to receive(:handle).with(event)

      event_bus.handle(
        [event]
      )
    end
    it 'should handle multiple events on one listener' do
      listener = double('listener')
      event = double('event')
      event1 = double('event')
      event_bus = Infrastructure::EventBus.new(
        listener
      )

      expect(listener).to receive(:handle).twice

      event_bus.handle(
        [event, event1]
      )
    end
  end
end
