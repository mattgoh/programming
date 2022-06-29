# define N 1024

float A[N][N];
float B[N][N];
float C[N][N];

int main() {

    for (int y = 0; y < N; y++) {
        for (int x=0; x < N; x++) {
            float acc = 0;
            for (int k = 0; k < N; k++){
                acc += A[y][k] * B[k][x];
            }
            C[y][x] = acc;
        }
    }

    return 0;
}