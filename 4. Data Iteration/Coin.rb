class Coin
    attr_reader :type, :side

    def initialize (type)
        @type = type
        @side = {
            heads: 0,
            tails: 0
        }
    end

    def is_heads(&block)
        @side[:heads] += 1
        print "#{type} coin toss resulted in "
        yield
    end

    def is_tails(&block)
        @side[:tails] += 1
        print "#{type} coin toss resulted in "
        yield
    end

    def print_stats
        puts "=========="
        puts "Toss Statistics:"
        puts "- Heads: #{@side[:heads]}"
        puts "- Tails: #{@side[:tails]}"
        puts "=========="
        yield self if block_given? # Yield to bloc, giving self arg, but only if a block was given (as determined with the block_given?) method
    end
end

coin = Coin.new("Quarter")
coin.print_stats

3.times do
    coin.is_heads do
        puts "Heads Baby!"
    end
end


2.times do
    coin.is_tails do
        puts "Tails! Hoo yah."
    end
end

coin.print_stats

coin.print_stats do |coin|
    puts "**********"
    puts "That's all folks, I've finally passed a block to this method. Final info:"
    puts "- Coin Type: #{coin.type}"
    puts "- Heads: #{coin.side[:heads]}"
    puts "- Tails: #{coin.side[:tails]}"
    puts "**********"
end