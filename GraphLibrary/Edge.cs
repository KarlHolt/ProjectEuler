namespace GraphSupport;

public class Edge<T> // By using <T> we enable nodes to an arbritary type
{
    private readonly T _origin;
    private readonly T _destination;
    private double? _weight;
    public Edge(T origin, T destination, double? weight = null)
    {
        _origin = origin;
        _destination = destination;
        _weight = weight;
    }
    public T Origin => _origin;
    public T Destination => _destination;
    public double? Weight => _weight;

    public void UpdateWeight(double? newWeight)
    {
        _weight = newWeight;
    }
}