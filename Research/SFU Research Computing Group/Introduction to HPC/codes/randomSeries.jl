using Random

function digitsin(digits::Int, num)
    base = 10
    while (digits ÷ base > 0)
        base *= 10
    end
    while num > 0
        if (num % base) == digits
            return true
        end
        num ÷= 10
    end
    return false
end

function slow(n::Int64, digits::Int)
    total = mapreduce(+,1:n) do i
        if !digitsin(digits, i)
            abs(randn(rng, Float32)) / i
        else
            0.0
        end
    end
    return total
end

rng = MersenneTwister(parse(Int32, ARGS[1]));
total = @time slow(Int64(1e8), 9)   # takes ~6s on my laptop
println("total = ", total)
