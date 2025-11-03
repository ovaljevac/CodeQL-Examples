/**
 * @name Beskonačne while petlje
 * @description Pronalazi while petlje u kojima se uslov nikada ne mijenja (npr. varijabla nije ažurirana unutar tijela).
 * @kind problem
 * @problem.severity warning
 * @id csharp/custom/beskonacna-petlja
 */

import csharp

from WhileStmt w, Variable v
where
  // varijabla se koristi u uslovu petlje (bilo gdje u izrazu)
  exists(VariableAccess va | 
    va.getTarget() = v and 
    va.getParent*() = w.getCondition()
  ) and
  // ali se nikada ne mijenja unutar tijela petlje
  not exists(AssignExpr assign |
    assign.getLValue().(VariableAccess).getTarget() = v and
    assign.getEnclosingStmt().getParent*() = w.getBody()
  ) and
  not exists(IncrementOperation incr |
    incr.getOperand().(VariableAccess).getTarget() = v and
    incr.getEnclosingStmt().getParent*() = w.getBody()
  ) and
  not exists(DecrementOperation decr |
    decr.getOperand().(VariableAccess).getTarget() = v and
    decr.getEnclosingStmt().getParent*() = w.getBody()
  )
select w, "Varijabla '" + v.getName() + "' se koristi u uslovu while petlje, ali se nikada ne mijenja — moguće beskonačna petlja."