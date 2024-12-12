# SclearDev, as of 12 Dec 2024
# CC 4.0 BY
# read more here: https://creativecommons.org/share-your-work/cclicenses/

temp = readline()
inputs = split(temp)
unordered = [1:length(inputs);]
max = -Inf
min = Inf
for i in unordered
    unordered[i] = parse(Int, inputs[i])
    if max < unordered[i]
        max = unordered[i]
    end
    if min > unordered[i]
        min = unordered[i]
    end
end

pigeon = fill(min-1, max-min+1)
gamma = abs(max) + abs(min)
# To avoid putting in tuples, we'll rely on the fact all elements will belong to some range.
# We'll use min-1 to define an empty spot, we'll add (max + min) to denote a repeated element.
# We'll use gamma to extend support to negative inputs.

for i in unordered
    ii = pigeon[i-min+1]
    if ii<min
        pigeon[i-min+1] = i
    else
        pigeon[i-min+1] += gamma
    end
end


### error here
ii = 1
for i in pigeon
    if (min <= i <= max)
        unordered[ii] = i
        ii += 1
    elseif i>max
        x = i%gamma
        iii = div(i, gamma) + 1
        for iv in 1:iii
            unordered[ii] = x
            ii += 1
        end
    end
end


