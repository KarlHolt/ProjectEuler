namespace p64;

class Program
{
    public static void Main()
    {
        ContinuedFractions c = new ContinuedFractions(42);
        
        int odds = 0;
        for (int i = 0; i <= 10000; i++)
        {
            if (Math.Sqrt(i) != Math.Floor(Math.Sqrt(i)))
            {
                c.SetToNewFraction(i);
                int length = c.FindRepeatingDigits().Count();
                if (length % 2 == 1)
                    odds++;
            }
        } 
        Console.WriteLine(odds);
    }
}