#ifdef _GLIBCXX_USE_INT128
#undef _GLIBCXX_USE_INT128
#endif 

#ifdef _GLIBCXX_ATOMIC_BUILTINS
#undef _GLIBCXX_ATOMIC_BUILTINS
#endif

#include <thrust/device_ptr.h>
#include <thrust/device_malloc.h>
#include <thrust/device_free.h>
#include <thrust/device_vector.h>
#include <cuda.h>

int main(void)
{
    size_t N = 10;

    // create a device_ptr 
    thrust::device_ptr<int> dev_ptr = thrust::device_malloc<int>(N);
     
    // extract raw pointer from device_ptr
    int * raw_ptr = thrust::raw_pointer_cast(dev_ptr);

    // use raw_ptr in non-thrust functions
    cudaMemset(raw_ptr, 0, N * sizeof(int));

    // free memory
    thrust::device_free(dev_ptr);

    
    // we can use the same approach for device_vector
    thrust::device_vector<int> d_vec(N);

    // note: &d_vec[0] returns a device_ptr
    raw_ptr = thrust::raw_pointer_cast(&d_vec[0]);

    // same as above
    raw_ptr = thrust::raw_pointer_cast(&*d_vec.begin());

	std::cout << "TEST PASSED\n";

    return 0;
}
