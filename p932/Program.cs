namespace p932;

class Program
{
    static void Main()
    {
        ulong sum = 0;
        ulong i = 4;
        ulong sq = i*i;
        do
        {
            if (Is2025(sq))
                sum += sq;
            i++;
            sq = i * i;
            if (i % 1000000 == 0)
                Console.WriteLine(i);
        } while (sq < Math.Pow(10, 16));
        Console.WriteLine(sum);
    }

    public static bool Is2025(ulong n)
    {
        bool is2025 = false;

        for (int i = 1; i < Math.Log10(n); i++)
        {
            ulong tenth = (ulong)Math.Pow(10, i);

            ulong n1 = n / tenth; // All above 10^i
            ulong n2 = n % tenth; // All below 10^i

            // If it has been split such that the first integer in n2 is a 0
            if (n2 < (tenth / 10))
                continue;

            ulong subtotal = n1 + n2;
            if (subtotal * subtotal == n)
            {
                is2025 = true;
                break;
            }
        }
        return is2025;
    }
}