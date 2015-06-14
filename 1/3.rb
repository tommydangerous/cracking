def permutation?(string1, string2)
  array1 = string1.split("")
  array2 = string2.split("")
  return (array1 - array2).size == 0 && (array2 - array1).size == 0
end
