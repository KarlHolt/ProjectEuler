namespace GraphLibrary;

using GraphSupport;
using System.Linq;

public class UndirectedUnweightedGraph<T> : Graph<T>
{
    public UndirectedUnweightedGraph() : base() { }

    public UndirectedUnweightedGraph(List<T> nodes){
        _nodes = nodes;
    }

    public override void AddNode(T node)
    {
        // Adds a node to the list of nodes
        /* ----- TODO -----
         * Should check if the node is already in the list before adding it!
         */
        _nodes.Add(node);
    }
    public override void AddEdge(T node1, T node2, double? weight = null)
    {
        /* ----- TODO -----
         * Since this is an Unweighted graph, we should throw an error whenever an attempt to create a weighted graph happens. 
         *      For now okay to just ignore problem, and focefully set the weight to null
         * Should also check if the edge is already in the graph!
         */
        _edges.Add(new Edge<T>(node1, node2, null));
    }

    public bool IsNeighbours(T node1, T node2)
    {
        // Checks whether or not there exist a node between two nodes
        bool directPathExits = false;
        if (node1.Equals(node2))
        {
            // A node is its own neighbour
            directPathExits = true;
        } 
        else
        {
            foreach(Edge<T> edge in _edges)
            {
                if((edge.Origin.Equals(node1) && edge.Destination.Equals(node2)) || (edge.Origin.Equals(node2) && edge.Destination.Equals(node1)))
                {
                    directPathExits = true;
                    break;
                }
            }
        }
        return directPathExits;
    }

    public List<T> NeighboursToNode(T origin)
    {
        // Returns all nodes which exits in a edge pair with origin node. i.e. can be reached in one step
        List<T> neighbours = new List<T>();
        foreach(Edge<T> edge in _edges)
        {
            if(edge.Origin.Equals(origin))
                neighbours.Add(edge.Destination);
            else if(edge.Destination.Equals(origin))
                neighbours.Add(edge.Origin);
        }
        return neighbours;
    }

    /*                                --------------------- Clique functions --------------------- 
     * A clique is a graph or sub-graph that is fully connected, the below code is used for finding Clique of certain length in a graph
     */
    public bool IsClique(List<T> nodes)
    {
        // Returns true if the nodes is fully connected
        bool isClique = true;
        foreach(T node1 in nodes)
        {
            foreach(T node2 in nodes)
            {
                if(!IsNeighbours(node1, node2)){
                    isClique = false;
                    break;
                }
            }
            if(!isClique)
            {
                // As soon as we see it is not a clique we should exit.
                break;
            }
        }
        return isClique;
    }

    private void FindCliquesRecursive(List<T>? searchSpace, List<T>? currentClique, int expectedCliqueSize, List<List<T>>? foundCliques)
    {
        /* A recursive fuction, that keeps adding nodes to 
         * Assumes no recursive edges i.e. (node1, node1).
         */
        if (currentClique.Count == expectedCliqueSize)
        {
            foundCliques.Add(new List<T>(currentClique));
            return;
        }
        if(searchSpace==null || searchSpace.Count == 0)
            return; // If the searchspace is empty exit
        else if(searchSpace.Count < expectedCliqueSize - currentClique.Count)
            return; // If the searchspace is lower than needed nodes, we give up on this patt
        T newNode = searchSpace.First();
        List<T>? newSearchSpaceWithout = searchSpace.Skip(1).ToList();
        FindCliquesRecursive(newSearchSpaceWithout, new List<T>(currentClique), expectedCliqueSize, foundCliques);

        currentClique.Add(newNode);
        List<T>? searchSpaceForNode = NeighboursToNode(newNode);
        List<T>? newSearchSpaceWith = searchSpace.Intersect(searchSpaceForNode).ToList();
        FindCliquesRecursive(newSearchSpaceWith, currentClique, expectedCliqueSize, foundCliques);
    }

    public List<List<T>> FindCliques(int length)
    {
        List<List<T>> result = new List<List<T>>();
        FindCliquesRecursive(Nodes, new List<T>(), length, result);

        return result;
    }
}