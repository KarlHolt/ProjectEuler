class Program
{
    static void Main()
    {
        /* Numebers above 9 will all increase faster than one digit per exponent increase, and since they start above, they can never obtain.
         * Numbers lower than 10 will always increase slower than one digit per exponent, so as soon as they can't keep up with the digits,
         *      they can be removed from the searchspace, when the search space is empty we have our solution.
         */
        int count = 0;
        List<int> nums = new List<int>(){ 1, 2, 3, 4, 5, 6, 7, 8, 9 };
        int i = 1;
        while (nums.Count() > 0)
        {
            double lowerLimit = Math.Pow(10, i - 1);
            // We don't need an upperLimit because of Observation in the top.
            foreach (int n in new List<int>(nums))
            {
                if (Math.Pow(n, i) < lowerLimit)
                    nums.Remove(n);
                else
                    count++;
            }
            i++;
        }
        Console.WriteLine(count);
    }   
}