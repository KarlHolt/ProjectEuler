namespace MyGraphApplication;

using PrimeLibrary;
using GraphLibrary;
class Program
{
    static void Main()
    {
        List<int> nodes = Prime.GetPrimes(9000);

        UndirectedUnweightedGraph<int> g = new UndirectedUnweightedGraph<int>(nodes);

        Console.WriteLine("Building Graph");
        foreach (int prime1 in nodes)
        {
            foreach (int prime2 in nodes)
            {
                if (prime2 > prime1)
                {
                    int concatInt = Convert.ToInt32(string.Join("", prime1, prime2));
                    int catconInt = Convert.ToInt32(string.Join("", prime2, prime1));

                    if (Prime.IsPrime(concatInt) && Prime.IsPrime(catconInt))
                        g.AddEdge(prime1, prime2);
                }
            }
        }

        Console.WriteLine("Looking for Cliques");
        List<List<int>> result = g.FindCliques(5);
        int max = int.MaxValue;
        List<int> best = new List<int>();
        foreach (List<int> list in result)
        {
            if (list.Sum() < max)
            {
                max = list.Sum();
                best = list;
            }
        }
        Console.WriteLine("Best list:" + string.Join(", ", best));
    }
}