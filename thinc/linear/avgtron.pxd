from cymem.cymem cimport Pool
from preshed.maps cimport PreshMap
from .features cimport ConjunctionExtracter
from ..typedefs cimport weight_t, feat_t, class_t
from ..structs cimport FeatureC
from ..structs cimport ExampleC


cdef class AveragedPerceptron:
    cdef readonly Pool mem
    cdef readonly PreshMap weights
    cdef readonly PreshMap averages
    cdef ConjunctionExtracter extracter
    cdef int time
    
    cdef void set_scores(self, weight_t* scores, const FeatureC* feats, int nr_feat) nogil
    cdef void update(self, ExampleC* eg) except *
    cpdef int update_weight(self, feat_t feat_id, class_t clas, weight_t upd) except -1
