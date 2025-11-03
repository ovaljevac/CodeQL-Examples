/**
 * @name Neiskorišteni parametar
 * @kind problem
 * @problem.severity warning
 * @id cs/unused-param
 */

import csharp

from Parameter p
where
  not exists(VariableAccess va | va.getTarget() = p) and
  p.getCallable().hasBody()
select p, "Neiskorišteni parametar: " + p.getName()