namespace GraphLibrary;

public class Node <Tid, Tlabel>
{
    protected Tid _id;
    protected Tlabel _label;


    public Node(Tid identifier)
    {
        _id = identifier;
        _label = default(Tlabel);
    }

    public Node(Tid identifier, Tlabel? label)
    {
        _id = identifier;
        _label = label;
    }
    public Tid Id => _id;
    public Tlabel Label => _label;
}