include("../perfutil.jl")

include("indexing.jl")

briefname(A) = typeof(A).name.name

# Small array tests
sz = (3,5)
Alist = makearrays(Int, sz)
for Ar in Alist
    @timeit sumelt(Ar, 10^5) string("sumeltIs ", briefname(Ar)) string("for a in A indexing, ", briefname(Ar)) sz
    @timeit sumeach(Ar, 10^5) string("sumeachIs ", briefname(Ar)) string("for I in eachindex(A), ", briefname(Ar)) sz
    applicable(getindex, Ar, Colon(), 1)  && @timeit sumcolon(Ar, 10^5) string("sumcolonIs ", briefname(Ar)) string("colon indexing, ", briefname(Ar)) sz
    applicable(getindex, Ar, 1:2, 1)      && @timeit sumrange(Ar, 10^5) string("sumrangeIs ", briefname(Ar)) string("range indexing, ", briefname(Ar)) sz
    applicable(getindex, Ar, trues(2), 1) && @timeit sumlogical(Ar, 10^5) string("sumlogicalIs ", briefname(Ar)) string("logical indexing, ", briefname(Ar)) sz
    applicable(getindex, Ar, [1,2], 1)    && @timeit sumvector(Ar, 10^5) string("sumvectorIs ", briefname(Ar)) string("vector indexing, ", briefname(Ar)) sz
end

Alist = makearrays(Float32, sz)   # SIMD-able
for Ar in Alist
    @timeit sumelt(Ar, 10^5) string("sumeltFs ", briefname(Ar)) string("for a in A indexing, ", briefname(Ar)) sz
    @timeit sumeach(Ar, 10^5) string("sumeachFs ", briefname(Ar)) string("for I in eachindex(A), ", briefname(Ar)) sz
    applicable(getindex, Ar, Colon(), 1)  && @timeit sumcolon(Ar, 10^5) string("sumcolonFs ", briefname(Ar)) string("colon indexing, ", briefname(Ar)) sz
    applicable(getindex, Ar, 1:2, 1)      && @timeit sumrange(Ar, 10^5) string("sumrangeFs ", briefname(Ar)) string("range indexing, ", briefname(Ar)) sz
    applicable(getindex, Ar, trues(2), 1) && @timeit sumlogical(Ar, 10^5) string("sumlogicalFs ", briefname(Ar)) string("logical indexing, ", briefname(Ar)) sz
    applicable(getindex, Ar, [1,2], 1)    && @timeit sumvector(Ar, 10^5) string("sumvectorFs ", briefname(Ar)) string("vector indexing, ", briefname(Ar)) sz
end

# Big array tests
sz = (300,500)
Alist = makearrays(Int, sz)
for Ar in Alist
    @timeit sumelt(Ar, 100) string("sumeltIb ", briefname(Ar)) string("for a in A indexing, ", briefname(Ar)) sz
    @timeit sumeach(Ar, 100) string("sumeachIb ", briefname(Ar)) string("for I in eachindex(A), ", briefname(Ar)) sz
    applicable(getindex, Ar, Colon(), 1)  && @timeit sumcolon(Ar, 100) string("sumcolonIb ", briefname(Ar)) string("colon indexing, ", briefname(Ar)) sz
    applicable(getindex, Ar, 1:2, 1)      && @timeit sumrange(Ar, 100) string("sumrangeIb ", briefname(Ar)) string("range indexing, ", briefname(Ar)) sz
    applicable(getindex, Ar, trues(2), 1) && @timeit sumlogical(Ar, 100) string("sumlogicalIb ", briefname(Ar)) string("logical indexing, ", briefname(Ar)) sz
    applicable(getindex, Ar, [1,2], 1)    && @timeit sumvector(Ar, 100) string("sumvectorIb ", briefname(Ar)) string("vector indexing, ", briefname(Ar)) sz
end

Alist = makearrays(Float32, sz)   # SIMD-able
for Ar in Alist
    @timeit sumelt(Ar, 100) string("sumeltFb ", briefname(Ar)) string("for a in A indexing, ", briefname(Ar)) sz
    @timeit sumeach(Ar, 100) string("sumeachFb ", briefname(Ar)) string("for I in eachindex(A), ", briefname(Ar)) sz
    applicable(getindex, Ar, Colon(), 1)  && @timeit sumcolon(Ar, 100) string("sumcolonFb ", briefname(Ar)) string("colon indexing, ", briefname(Ar)) sz
    applicable(getindex, Ar, 1:2, 1)      && @timeit sumrange(Ar, 100) string("sumrangeFb ", briefname(Ar)) string("range indexing, ", briefname(Ar)) sz
    applicable(getindex, Ar, trues(2), 1) && @timeit sumlogical(Ar, 100) string("sumlogicalFb ", briefname(Ar)) string("logical indexing, ", briefname(Ar)) sz
    applicable(getindex, Ar, [1,2], 1)    && @timeit sumvector(Ar, 100) string("sumvectorFb ", briefname(Ar)) string("vector indexing, ", briefname(Ar)) sz
end
