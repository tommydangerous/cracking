# The Game of Master Mind is played as follows:
# The computer has four slots, and each slot will contain a ball that is
# red (R), yellow (Y), green (G) or blue (B). For example, the computer might
# have RGGB {Slot #1 is red, Slots #2 and #3 are green, Slot #4 is blue).

# You, the user, are trying to guess the solution. You might, for example,
# guess YRGB.
# When you guess the correct color for the correct slot, you get a "hit." If
# you guess a color that exists but is in the wrong slot, you get a
# "pseudo-hit." Note that a slot that is a hit can never count as a pseudo-hit.

# For example, if the actual solution is RGBY and you guess GGRR, you have one
# hit and one pseudo-hit.

# Write a method that, given a guess and a solution, returns the number of hits
# and pseudo-hits.

def master_mind(solution, guess):
    hits = 0
    pseudo_hits = 0

    solution_array = list(solution)
    guess_array = list(guess)

    for index, guess in enumerate(guess_array):
        if solution_array[index] == guess:
            hits += 1
            solution_array[index] = None
            guess_array[index] = None

    for index, solution in enumerate(solution_array):
        if solution and solution in guess_array:
            pseudo_hits += 1
            guess_array[guess_array.index(solution)] = None
            solution_array[index] = None

    print guess_array

    return (hits, pseudo_hits)

print master_mind('RGBY', 'GGRR')
