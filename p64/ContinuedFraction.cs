namespace p64;

using System;
using System.Collections.Generic;

class ContinuedFractions
{
    private double _n;
    private double _m;
    private double _a;
    private double _d;

    public ContinuedFractions(int number)
    {
        SetToNewFraction(number);
    }

    public void SetToNewFraction(int n)
    {
        _n = n;
        _m = 0;
        _d = 1;
        _a = Math.Floor(Math.Sqrt(n));
    }

    public int NextDigit()
    {
        double lastA = _a;
        _m = _d * _a - _m;
        _d = (_n - _m * _m) / _d;
        _a = Math.Floor((Math.Floor(Math.Sqrt(_n)) + _m) / _d);
        return (int)lastA;
    }

    public List<int> FindRepeatingDigits()
    {
        List<int> digits = new List<int>();
        // It would be bettter if we initiated with a small number of digits, like 50, and increased to validate pattern.
        for (int i = 0; i < 1000; i++)
        {
            digits.Add(NextDigit());
        }
        List<int> repeating = new List<int>();
        bool patternFound = false;
        while (!patternFound)
        {
            /* Each iteration of the loop, we remove the first digit, (initially the integer part) 
             * and see if the new first is the beginnig of a pattern
             */
            digits.RemoveAt(0);
            List<int> potentialRepetitionEndIndexs = new List<int>();
            for (int i=1; i< digits.Count(); i++) {
                if (digits[i] == digits[0])
                    potentialRepetitionEndIndexs.Add(i);
            }
            foreach (int poEnd in potentialRepetitionEndIndexs)
            {
                List<int> pattern = digits.Slice(0, poEnd);
                patternFound = CheckPattern(pattern, digits);
                if (patternFound)
                {
                    repeating = pattern;
                    break;
                }
            }
        }
        return repeating;
    }

    public bool CheckPattern(List<int> pattern, List<int> digits)
    {
        int patternPointer = 0;
        bool patternHolds = true;
        foreach (int digit in digits)
        {
            if (pattern[patternPointer] != digit)
            {
                patternHolds = false;
                break;
            }

            patternPointer++;
            if (patternPointer == pattern.Count())
                patternPointer = 0;
        }
        return patternHolds;
    }
}