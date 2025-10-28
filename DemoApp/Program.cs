using System;

namespace DemoApp
{
    class Calculator
    {
        // 1) Neiskorišteno polje
        private int _unusedField = 42;

        // 2) Beskonačna petlja (nema break/return/throw/promjene stanja)
        public void SpinForever()
        {
            int i = 0;
            while (i < 10)
            {
                Console.WriteLine("Looping...");
                // i se nikad ne mijenja -> uslov ostaje true zauvijek
            }
        }

        // 3) Varijabla deklarisana ali se ne koristi (unused local)
        public int Sum(int a, int b)
        {
            int tmp; // nikad korišteno
            int sum = a + b;
            return sum;
        }

        // 4) Potencijalni NullReference (korištenje bez provjere)
        public int LengthOf(string? s)
        {
            // s može biti null -> potencijalna dereferencija null-a
            return s.Length;
        }

        // 5) Parametar koji se ne koristi
        public void PrintFixedMessage(string message)
        {
            Console.WriteLine("Hello!"); // message se ne koristi
        }

        // 6) "Shadowing" lokalne varijable (zbunjujuće, kvalitativna greška)
        private int total = 0;
        public void AddToTotal(int total)
        {
            // lokalni 'total' zasjenjuje polje 'total'
            total += 5; // mijenja parametar, ne polje
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            var calc = new Calculator();
            Console.WriteLine(calc.Sum(1, 2));
            calc.PrintFixedMessage("ignored");
            // sljedeće dvije linije izazivaju probleme:
            // calc.SpinForever();                // -> beskonačna petlja (komentirano da konzola ne zablokira)
            Console.WriteLine(calc.LengthOf(null)); // -> NullReferenceException u runtime-u
        }
    }
}
