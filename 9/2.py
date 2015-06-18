# Imagine a robot sitting on the upper left corner of an X by Y grid. The robot
# can only move in two directions: right and down. How many possible paths are
# there for the robot to go from (0,0) to (X,Y)?

# FOLLOW UP

# Imagine certain spots are "off limits," such that the robot cannot step on
# them. Design an algorithm to find a path for the robot from the top left to
# the bottom right.

def count_paths(x, y, cached_paths = {}, offlimits = []):
    cached_paths.setdefault((x, y), None)

    try:
        block = offlimits.index((x, y))
    except ValueError:
        block = -1

    if block > -1:
        return 0
    elif x == 0 and y == 0:
        return 1
    elif cached_paths[(x, y)]:
        return cached_paths[(x, y)]
    elif y == 0:
        return count_paths(x - 1, y, cached_paths, offlimits)
    elif x == 0:
        return count_paths(x, y - 1, cached_paths, offlimits)
    else:
        cached_paths[(x, y)] = (
            count_paths(x - 1, y, cached_paths, offlimits) +
            count_paths(x, y - 1, cached_paths, offlimits)
        )
        return cached_paths[(x, y)]

print count_paths(5, 5)
