namespace Problem61;

public class Sequence
{
    // Creating a delegate for cleaner code
    private delegate int SequenceMethod(int i);

    private int[] _state;
    private int[] _implementedSequences;
    private  SequenceMethod[] sequenceMethods;
    public Sequence(){
        _state = new int[]{0, 0, 0, 0, 0, 0};
        _implementedSequences = new int[]{3, 4, 5, 6, 7, 8};
        sequenceMethods = new SequenceMethod[] {
            TriangleSeq,
            SquareSeq,
            PentagonalSeq,
            HexgonalSeq,
            HeptagonalSeq,
            OctagonalSeq
        };
    }
    public int Next(int sequence){
        if(-1==Array.IndexOf(_implementedSequences, sequence))
        {
            Console.WriteLine("An attempt was made to access a sequence which is not implemented");
            return -1;
        }
        int index = sequence-3;
        int state = _state[index]++;
        return sequenceMethods[index](state);
    }

    public List<int> SequenceInRange(int sequence, int lowerLimit, int upperLimit)
    {
        List<int> result = new List<int>();
        int[] oldState = (int[])_state.Clone();
        _state = new int[]{0, 0, 0, 0, 0, 0};
        int nextNumber = Next(sequence);
        while(nextNumber<upperLimit)
        {
            if(nextNumber>lowerLimit)
            {
                result.Add(nextNumber);
            }
            nextNumber = Next(sequence);
        }
        _state = oldState;
        return result;
    }

    public int GeneralSequence(int i, int a, int b, int c)
    {
        /* All the defined sequences can be written on the format i*((a*i+b)/c) 
         * So to highlite this relationship, this method is used.
         */
        return i*((a*i+b)/c);
    }

    public int GeneralSequence(int i, int a, int b)
    {
        /* This is a special case of the 4 parameter, in which c is 1, i.e. no reason to spend time on dividing
         */
        return i*(a*i+b);
    }

    public int TriangleSeq(int i)
    {
        return GeneralSequence(i, 1, 1, 2);
    }

    public int SquareSeq(int i)
    {
        return GeneralSequence(i, 1, 0);
    }

    public int PentagonalSeq(int i)
    {
        return GeneralSequence(i, 3, -1, 2);
    }

    public int HexgonalSeq(int i)
    {
        return GeneralSequence(i, 2, -1);
    }

    public int HeptagonalSeq(int i)
    {
        return GeneralSequence(i, 5, -3, 2);
    }

    public int OctagonalSeq(int i)
    {
        return GeneralSequence(i, 3, -2);
    }
}