# Listening Device

# Below we have a listening device. It lets us record something that is said and store it for later use. In general, this is how the device should be used:

# Listen for something, and if anything is said, record it for later use. If nothing is said, then do not record anything.

class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    # recording = yield if block_given?
    # record(recording) if recording
    record(yield) if block_given?
  end

  def play
    puts @recordings.last
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"