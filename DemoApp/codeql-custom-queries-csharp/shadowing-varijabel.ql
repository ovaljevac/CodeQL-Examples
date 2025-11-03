/**
 * @name Parametar zasjenjuje polje
 * @kind problem
 * @problem.severity warning
 * @id cs/param-shadows-field
 */

import csharp

from Field f, Parameter p
where
  p.getName() = f.getName() and
  p.getCallable().getDeclaringType() = f.getDeclaringType()
select p, 
  "Parametar '" + p.getName() + "' ima isto ime kao polje u klasi, što može dovesti do zabune."