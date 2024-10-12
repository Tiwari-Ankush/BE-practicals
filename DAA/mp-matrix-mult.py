import threading
import time

def input_matrix(rows, cols, name):
    print(f"Enter elements for {name} matrix ({rows}x{cols}):")
    matrix = []
    for i in range(rows):
        row = list(map(int, input(f"Row {i + 1}: ").split()))
        if len(row) != cols:
            raise ValueError(f"Each row must have exactly {cols} elements.")
        matrix.append(row)
    return matrix

def print_matrix(matrix, name):
    print(f"\n{name} Matrix:")
    for row in matrix:
        print(" ".join(map(str, row)))

def regular_matrix_multiplication(A, B):
    rows_A, cols_A = len(A), len(A[0])
    cols_B = len(B[0])
    result = [[0] * cols_B for _ in range(rows_A)]
    for i in range(rows_A):
        for j in range(cols_B):
            result[i][j] = sum(A[i][k] * B[k][j] for k in range(cols_A))
    return result

def threaded_multiplication(A, B, result, i, j):
    result[i][j] = sum(A[i][k] * B[k][j] for k in range(len(A[0])))

def multithreaded_matrix_multiplication(A, B):
    rows_A, cols_B = len(A), len(B[0])
    result = [[0] * cols_B for _ in range(rows_A)]
    threads = []

    for i in range(rows_A):
        for j in range(cols_B):
            thread = threading.Thread(target=threaded_multiplication, args=(A, B, result, i, j))
            threads.append(thread)
            thread.start()

    for thread in threads:
        thread.join()

    return result

def compare_performance(A, B):
    start = time.time()
    regular_result = regular_matrix_multiplication(A, B)
    regular_time = time.time() - start

    start = time.time()
    threaded_result = multithreaded_matrix_multiplication(A, B)
    threaded_time = time.time() - start

    print("\nRegular Matrix Multiplication Result:")
    print_matrix(regular_result, "Regular")

    print("\nMultithreaded Matrix Multiplication Result:")
    print_matrix(threaded_result, "Multithreaded")

    print(f"\nTime Taken (Regular): {regular_time:.6f} seconds")
    print(f"Time Taken (Multithreaded): {threaded_time:.6f} seconds")

def main():
    try:
        rows_A = int(input("Enter the number of rows for Matrix A: "))
        cols_A = int(input("Enter the number of columns for Matrix A: "))
        rows_B = int(input("Enter the number of rows for Matrix B: "))
        cols_B = int(input("Enter the number of columns for Matrix B: "))

        if cols_A != rows_B:
            raise ValueError("Matrix A's columns must match Matrix B's rows for multiplication.")

        A = input_matrix(rows_A, cols_A, "A")
        B = input_matrix(rows_B, cols_B, "B")

        print_matrix(A, "Matrix A")
        print_matrix(B, "Matrix B")

        compare_performance(A, B)

    except ValueError as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    main()
