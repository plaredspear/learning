class Endian
  def self.convert(input)
    msb = 0

    4.times do
      msb <<= 8
      lsb = input & 0xFF
      msb = msb + lsb
      input >>= 8
    end

    msb
  end
end
