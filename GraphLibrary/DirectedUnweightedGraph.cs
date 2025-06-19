namespace GraphLibrary;

using GraphSupport;
using System.Linq;

public class DirectedUnweightedGraph<T> : Graph<T>
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
                if(edge.Origin.Equals(node1) && edge.Destination.Equals(node2))
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
        }
        return neighbours;
    }
}