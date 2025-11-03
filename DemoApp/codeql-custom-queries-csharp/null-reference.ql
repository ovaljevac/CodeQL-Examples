/**
 * @name Nullable dereferencija
 * @kind problem
 * @problem.severity error
 * @id cs/null-deref
 */

import csharp

from Parameter p, MemberAccess ma
where
  p.getType() instanceof NullableType and
  ma.getQualifier().(VariableAccess).getTarget() = p
select ma, "Nesiguran pristup na nullable parametru '" + p.getName() + "'."