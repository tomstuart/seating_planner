class Hash
  def to_histogram(width)
    keys, values = sort.transpose
    values = values.map(&:size)

    max_value = values.max
    max_key_width = keys.map { |key| key.to_s.length }.max
    max_bar_width = width - max_key_width - max_value.to_s.length - 3
    scale = max_value.to_f / max_bar_width

    bars = keys.zip(values).map { |key, value|
      sprintf "%#{max_key_width}s: %-#{max_bar_width}s %#{max_value.to_s.length}s", key, '#' * (value / scale), value
    }

    bars.join("\n") + "\n\n" + values.inject(:+).to_s.rjust(width)
  end
end
