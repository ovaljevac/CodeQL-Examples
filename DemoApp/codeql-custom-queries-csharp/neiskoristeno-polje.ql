/**
 * @name Neiskorišteno polje
 * @kind problem
 * @problem.severity warning
 * @id cs/unused-field-simple
 */

import csharp

from Field f
where
  f.isPrivate() and
  not exists(FieldAccess fa | fa.getTarget() = f)
select f, "Privatno polje '" + f.getName() + "' nije korišteno."