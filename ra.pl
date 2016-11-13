 length(A,N)
produceInnerRenameList(N,IRL)
produceConstantConditions(A, IRL, CC)
produceRepeatedVariableConditions(A, IRL, RC)
append(CC, RC, SL)
produceProjectList(A, IRL, PL)
produceOuterRenameList(A, IRL, ORL)
generateRAquery(IRL, SL, PL, ORL, Q)


