namespace Problem61;

using System.Numerics;
struct Cube
{
    public string Represetation;
    public int Instances;
    public BigInteger SmallestInstance;

    public Cube(string rep, int ints, BigInteger si)
    {
        Represetation = rep;
        Instances = ints;
        SmallestInstance = si;
    }
}

class Program
{
    static void Main()
    {
        int numberOfPermutationsWanted = 5;

        List<Cube> cubes = new List<Cube>();
        // Create a permutation list of strings for quicker lookup
        List<string> permutations = new List<string>();

        bool found = false;
        BigInteger smallestCube = 0;
        BigInteger i = 2;
        int nDecimals = 1;
        while (true)
        {
            BigInteger cube = i * i * i;
            string permutation = DigitsInNondecreasingOdrer(cube);

            /* We know we can stop looking when the number of digits increases frow when we found a solution, since cubes are strictly increasing
             * We can't stop on the first because, 1299:(9912, 9219, 9129) and 1888(8188, 8818, 8881). 
             *      here 1888s permutation would be found first, but 1299 is lower
             */
            if (cube.ToString().Length > nDecimals)
            {
                if (found)
                    break;
                // This code is not needed, because the searchspace is so small. But it builds on a nice observation, and would prove usefull for bigger searchspaces.
                nDecimals = cube.ToString().Length;
                permutations = new List<string>();
                cubes = new List<Cube>();
            }

            if (permutations.Contains(permutation))
            {
                for (int j = 0; j < cubes.Count(); j++)
                {
                    if (cubes[j].Represetation == permutation)
                    {
                        Cube c = cubes[j];
                        c.Instances += 1;

                        if (c.Instances >= numberOfPermutationsWanted)
                        {
                            // If it is the first time we hit the required number of permutation OR 
                            //      the new smallest is smaller the the last smallest set smallestCube accordingly
                            if (!found || (found && c.SmallestInstance < smallestCube))
                            {
                                smallestCube = c.SmallestInstance;
                            }
                            found = true;
                        }
                        cubes[j] = c;
                    }
                }
            }
            else
            {
                cubes.Add(new Cube(permutation, 1, cube));
                permutations.Add(permutation);
            }
            i++;
        }
        Console.WriteLine(smallestCube);
    }

    public static string DigitsInNondecreasingOdrer(BigInteger num)
    {
        char[] result = num.ToString().ToCharArray();
        Array.Sort(result);
        return new string(result);
    }
}