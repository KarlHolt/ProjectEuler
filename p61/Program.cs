namespace Problem61;
using Problem61;
using GraphLibrary;

class Program
{
    static void Main()
    {
        int lengthOfChain = 6;
        // Create sequence
        Sequence seq = new Sequence();
        List<Node<int, int>> nodes = new List<Node<int, int>>();

        for(int i=3; i<3+lengthOfChain; i++)
        {
            // The problem tell us we only has to look at 4 digit numbers, i.e. ]999, 10000[
            List<int> sequence = seq.SequenceInRange(i, 999, 10000);
            foreach (int num in sequence)
            {
                /* 
                 * Realizing that each numbers last two digits has to be the first in one of the other we can further
                 *      prune our search space, since no 4 digit number can start with a 0. i.e. all numbers on the 
                 *      format XX0X, can be pruned.
                 */
                if(num%100>9){
                    nodes.Add(new Node<int, int>(num,i));
                }
            }
        }

        DirectedUnweightedGraph<Node<int,int>> g = new DirectedUnweightedGraph<Node<int, int>>(nodes);
        foreach(Node<int, int> node1 in nodes){
            foreach(Node<int, int> node2 in nodes){
                if(!node1.Label.Equals(node2.Label))
                {
                    if(node1.Id%100==node2.Id/100){
                        g.AddEdge(node1, node2);
                    }
                }
            }
        }

        List<List<Node<int,int>>> longestCycle = FindFullCycle(nodes, g, lengthOfChain);
        int sum=0;
        foreach(Node<int,int> node in longestCycle.Last())
        {
            Console.WriteLine(node.Id);
            sum+=node.Id;
        }
        Console.WriteLine(sum);
    }

    public static List<List<Node<int, int>>> FindFullCycle(List<Node<int,int>> nodes, DirectedUnweightedGraph<Node<int, int>> g, int length)
    {
        List<List<Node<int, int>>> result = new();
        FindCycle(g, new List<Node<int, int>>(), new List<int>(), length, result);

        return result;
    }

    public static void FindCycle(DirectedUnweightedGraph<Node<int, int>> g, List<Node<int, int>> current, List<int> groupsUsed,  int length, List<List<Node<int, int>>> result)
    {
        if(current.Count()==length){
            result.Add(new List<Node<int, int>>(current));
            return;
        }

        List<Node<int, int>> neighbours;
        if (current.Count>0)
        {
            neighbours = FindCandidates(g, current.Last(), groupsUsed);
        }
        else
        {
            neighbours = g.Nodes;
        }
        foreach(Node<int,int> node in neighbours){
            if(current.Count()+1==length){
                if(g.IsNeighbours(node, current.First())){
                    List<Node<int,int>> currentClone = new(current);
                    currentClone.Add(node);
                    List<int> groupsUsedClone = new(groupsUsed);
                    groupsUsedClone.Add(node.Label);
                    FindCycle(g, currentClone, groupsUsedClone, length, result);
                }
            }
            else
            {
                List<Node<int,int>> currentClone = new(current);
                currentClone.Add(node);
                List<int> groupsUsedClone = new(groupsUsed);
                groupsUsedClone.Add(node.Label);
                FindCycle(g, currentClone, groupsUsedClone, length, result);
            }
        }
    }

    public static List<Node<int, int>> FindCandidates(DirectedUnweightedGraph<Node<int, int>> g, Node<int, int> origin, List<int> groupsUsed){
        List<Node<int, int>> neighbours = g.NeighboursToNode(origin);
        
        List<Node<int,int>> result = new();
        foreach(Node<int,int> node in neighbours)
        {
            if(!groupsUsed.Contains(node.Label)){
                result.Add(node);
            }
        }
        return result;
    }
}