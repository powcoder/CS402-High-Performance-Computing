https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
#include <omp.h>
#include <stdio.h>

float f(float x);

int main (int argc, char** argv) {
    int a = 0.0;     // Left endpoint
    int b = 1.0;     // Right endpoint
    long n = 1024000000;    // Number of trapezoids
    double h = (b - a) / ((double) n);         // Base length
    double integral = (f(a) + f(b)) / 2.0;
    long i;
    double x = a;

    for(i = 1; i <= n; i++) {
        x = x + h;
        integral = integral + f(x);
    }

    integral = integral*h;

    printf("With n = %d trapezoids, estimate: %f\n", n, integral);
}

// The function to integrate, here we use 2 / (x^4 + 1)
float f(float x) {
    return 2 / ((x*x*x*x) + 1);
}
