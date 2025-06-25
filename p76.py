def waysToSum(num):
    ways = [0] * (num + 1)
    ways[0] = 1 

    for i in range(1, num):
        for j in range(i, num + 1):
            ways[j] += ways[j - i]

    return ways[num]

print(waysToSum(100))