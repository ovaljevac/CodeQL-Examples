import csharp

from Parameter p, MemberAccess ma
where
  ma.getQualifier() instanceof ParameterAccess and
  ma.getQualifier().(ParameterAccess).getTarget() = p and
  p.getType() instanceof RefType
select ma,
  "Potencijalni NullReference: parametar '" + p.getName() + "' se dereferencira bez provjere na null."
