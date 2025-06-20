namespace PrimeLibrary;

public static class Prime
{
    public static bool IsPrime(int number)
    {
        // Handle special cases
        if (number <= 1) return false; // 0 and 1 are not prime
        if (number <= 3) return true;  // 2 and 3 are prime

        // Eliminate even numbers and multiples of 3 
        if (number % 2 == 0) return false;
        int boundary = (int)Math.Floor(Math.Sqrt(number));

        // Check for factors from 5 to the square root of the number
        for (int i = 3; i <= boundary; i += 2)
        {
            if (number % i == 0)
            {
                return false;
            }
        }
        return true;
    }

    public static List<int> GetPrimes(int limit)
    {
        /* GetPrimes takes an integer limit and returns all primes in the range 2…limit, including both 2 and limit.
        */
        if (limit < 2) return new List<int>(); // No primes less than 2

        // We first assume all integers in the range are primes
        // Below we will exclude all whitch turns out to not be prime
        bool[] isPrime = new bool[limit];
        for (int i = 2; i < limit; i++)
        {
            isPrime[i] = true;
        }

        // Implement the Sieve of Eratosthenes
        var sqrtOfLimit = Math.Sqrt(limit);
        for (int p = 2; p < sqrtOfLimit; p++)
        {
            if (isPrime[p])
            {
                // Mark all multiples of p as false 
                // We can start searching at p*p since any number of which p is a primefactor with a multiple less 
                //      than p would have been found when checking for the lower prime
                for (int multiple = p * p; multiple < limit; multiple += p)
                {
                    isPrime[multiple] = false;
                }
            }
        }
        // Collect all prime numbers
        List<int> primes = new List<int>();
        for (int i = 2; i < limit; i++)
        {
            if (isPrime[i])
            {
                primes.Add(i);
            }
        }
        return primes;
    }
}