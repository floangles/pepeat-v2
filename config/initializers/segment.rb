Analytics = Segment::Analytics.new({
    write_key: 'v8l8LSHnkCEyheN0zBBXu1KsZz3EOHru',
    on_error: Proc.new { |status, msg| print msg }
})
