def recursive_fibonacci(n):
    if n <= 1:
        return n
    else:
        return recursive_fibonacci(n - 1) + recursive_fibonacci(n - 2)

def non_recursive_fibonacci(n):
    first = 0
    second = 1
    print(first, end=" ")
    if n > 1:
        print(second, end=" ")
    for _ in range(n - 2):
        third = first + second
        print(third, end=" ")
        first, second = second, third
    print()

if __name__ == "__main__":
    n = 10
    print("Recursive Fibonacci Sequence:")
    for i in range(n):
        print(recursive_fibonacci(i), end=" ")
    print()
    print("Non-Recursive Fibonacci Sequence:")
    non_recursive_fibonacci(n)
    
    