/**
 * @ime Neiskorištene lokalne varijable
 * @opis Pronalazi lokalne varijable koje su deklarisane, ali se nikada ne koriste.
 * @vrsta problem
 * @ozbiljnost upozorenje
 * @id csharp/custom/neiskoristene-varijable
 */
import csharp

from LocalVariable v
where not exists(VariableAccess access | access.getTarget() = v)
select v, "Lokalna varijabla '" + v.getName() + "' je deklarisana, ali se nikada ne koristi."
