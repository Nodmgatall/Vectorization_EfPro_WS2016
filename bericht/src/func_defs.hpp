#include "type_declaration.hpp"

void vectorizable(aligned_type *__restrict__ vec1, aligned_type *__restrict__ vec2,
                  unsigned long size, aligned_type *__restrict__ return_vec);


void normal(type *vec1, type *vec2, unsigned long size, type *return_vec);


void no_alias(type *__restrict__ vec1, type *__restrict__ vec2, unsigned long size,
              type *__restrict__ return_vec);

void aligned(aligned_type *vec1, aligned_type *vec2, unsigned long size, aligned_type *return_vec);
