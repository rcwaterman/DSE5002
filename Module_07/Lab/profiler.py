from time import time

def profile(func):
    def wrapper(*args, **kwargs):
        start = time()
        result = func(*args, **kwargs)
        end = time()
        execution_time_ms = (end-start)
        print(f'{func.__name__} took {execution_time_ms} seconds')
        return result
    return wrapper

