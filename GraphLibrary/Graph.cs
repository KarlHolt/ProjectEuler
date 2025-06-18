namespace GraphLibrary;

using GraphSupport;

public abstract class Graph<T>
{
    protected List<T> _nodes;
    protected List<Edge<T>> _edges;

    protected Graph()
    {
        _nodes = new List<T>();
        _edges = new List<Edge<T>>();
    }

    public List<T> Nodes => _nodes;
    public List<Edge<T>> Edges => _edges;

    public abstract void AddNode(T node);
    public abstract void AddEdge(T node1, T node2, double? weight);
}