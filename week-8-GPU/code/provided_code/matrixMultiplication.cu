#include <stdio.h>
#include <omp.h>

#define BLOCK_SIZE 16

__global__ 
void mat_mult(float *A, float *B, float *C, int N){
    int row = 0;//TODO
    int col = 0;//TODO

    float sum = 0.0f;
    for (int n = 0; n < N; ++n) {
        sum += A[row*N+n]*B[n*N+col];
    }

    C[row*N+col] = sum;
}

void mat_mult_cpu(float *A, float *B, float *C, int N) {
    #pragma omp parallel for
    for (int row=0; row<N; ++row) {
        for (int col=0; col<N; ++col) {
            float sum = 0.0f;
            for (int n = 0; n < N; ++n){
                sum += A[row*N+n]*B[n*N+col];
            }
            C[row*N+col] = sum;
        }
    }
}

int main(int argc, char *argv[]){
    
    int N,K;
    K = 100;            
    N = K*BLOCK_SIZE;
    
    float *hA,*hB,*hC;
    hA = new float[N*N];
    hB = new float[N*N];
    hC = new float[N*N];

    for (int j=0; j<N; j++){
        for (int i=0; i<N; i++){
            hA[j*N+i] = 2.f*(j+i);
            hB[j*N+i] = 1.f*(j-i);
        }
    }

    int size = N*N*sizeof(float);
    float *dA,*dB,*dC;
    cudaMalloc(&dA,size);
    cudaMalloc(&dB,size);
    cudaMalloc(&dC,size);

    dim3 threadBlock(BLOCK_SIZE,BLOCK_SIZE);
    dim3 grid(K,K);

    cudaMemcpy(dA,hA,size,cudaMemcpyHostToDevice);
    cudaMemcpy(dB,hB,size,cudaMemcpyHostToDevice);
    
    mat_mult<<<grid,threadBlock>>>(dA,dB,dC,N);
    if (cudaPeekAtLastError() != cudaSuccess) {
        fprintf(stderr, "CUDA error detected: \"%s\"\n", cudaGetErrorString(cudaGetLastError()));
        return 1;
    }
    
    float *C;
    C = new float[N*N];
    cudaMemcpy(C,dC,size,cudaMemcpyDeviceToHost);

    mat_mult_cpu(hA, hB, hC, N);

    for (int row=0; row<N; row++) {
        for (int col=0; col<N; col++) {
            if ( C[row*N+col] != hC[row*N+col] ){
                fprintf(stderr,"Validation failed at row=%d, col=%d.\n", row, col);
                return 1;
            }
        }
    }
}
