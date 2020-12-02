def timer
  raise RuntimeError, 'No block given' unless block_given?

  time_before = Time.now
  yield(10,000,000)
  time_after = Time.now
  puts "#{time_after - time_before} seconds"
end

p timer { |x| i = x.to_s } # 1.777e-06 seconds

timer # No block given (RuntimeError)