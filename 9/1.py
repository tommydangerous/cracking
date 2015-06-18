# A child is running up a staircase with n steps, and can hop either 1 step, 2
# steps, or 3 steps at a time. Implement a method to count how many possible
# ways the child can run up the stairs.

def count_ways(steps):
    if steps < 0:
        return 0
    elif steps == 0:
        return 1
    else:
        return (count_ways(steps - 1) + count_ways(steps - 2) +
            count_ways(steps - 3))

def count_ways_dp(steps, counted_ways = {}):
    counted_ways.setdefault(steps, None)
    counted_ways_steps = counted_ways[steps]

    if steps < 0:
        return 0
    elif steps == 0:
        return 1
    elif counted_ways_steps:
        return counted_ways[steps]
    else:
        counted_ways[steps] = (
            count_ways_dp(steps - 1, counted_ways) +
            count_ways_dp(steps - 2, counted_ways) +
            count_ways_dp(steps - 3, counted_ways)
        )
        return counted_ways[steps]

print count_ways_dp(3)
