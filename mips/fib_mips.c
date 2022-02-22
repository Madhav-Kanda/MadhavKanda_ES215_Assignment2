#include <stdio.h>
#include <time.h>
#include <stdlib.h>

struct timespec;

time_t clk1;
time_t clk2;

double fibonacci(double n)
{
    if (n == 0)
    {
        return 0;
    }
    else if (n == 1 || n == 2)
    {
        return 1;
    }
    else
    {
        double i = 0;
        double prev_value = 0;
        double value = 1;
        while (i < n - 1)
        {
            double temp = value;
            value = value + prev_value;
            prev_value = temp;
            i++;
        }
        return value;
    }
}

int main()
{
    clk1 = clock();
    for (int i = 0; i <= 100; i++)
    {
        // cout << i << " ";
        printf("%d ", i);
        printf("%f\n", fibonacci(i));
        // cout << endl;
    }
    clk2 = clock() - clk1;
    float CPU = (float)clk2 / CLOCKS_PER_SEC;
    // cout << "The time taken by the program on CPU using loop is:"
    //      << " ";
    // cout << CPU << endl;
    printf("The time taken by the program on CPU using loop is %f", CPU);
}