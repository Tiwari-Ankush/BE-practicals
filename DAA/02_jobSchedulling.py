def job_sequencing(jobs, n):
    jobs.sort(key=lambda x: x[2], reverse=True)
    result = [-1] * n
    for job in jobs:
        for i in range(min(n - 1, job[1] - 1), -1, -1):
            if result[i] == -1:
                result[i] = job[0]
                break
    return [job for job in result if job != -1]

jobs = [(1, 2, 100), (2, 1, 19), (3, 2, 27), (4, 1, 25), (5, 3, 15)]
n = 3
print(job_sequencing(jobs, n))
