import calculator as calc
import calculator2 as calc2
from timeit import Timer
from functools import partial
import numpy as np
from collections import defaultdict

list_len = 100000

a1 = np.array(np.random.randint(0, 10000, list_len)).reshape(list_len,1)
a2 = np.array(np.random.randint(0, 10000, list_len)).reshape(list_len,1)

def find_differences(result1, result2):
    r1 = defaultdict(int)
    r2 = defaultdict(int)

    for i in range(list_len):
        r1[i]=result1[i][0]
        r2[i]=result2[i][0]

    set1 = set(r1.items())
    set2 = set(r2.items())

    differences = set1 - set2

    return differences

if __name__ == '__main__':
    # found this here https://stackoverflow.com/questions/54135771/timeit-valueerror-stmt-is-neither-a-string-nor-callable
    t1 = Timer(partial(calc.add,a1,a2))
    print(f'Time for calc add: {t1.timeit(100)}')

    t2 = Timer(partial(calc2.add,a1,a2))
    print(f'Time for calc2 add: {t2.timeit(100)}')

    r1 = calc.add(a1,a2)
    r2 = calc2.add(a1,a2)

    diff = find_differences(r1, r2)

    if len(diff)==0:
        print('Results for addition are equivalent')
    else:
        print("The following values do not match:")
        print(diff)
    
    t3 = Timer(partial(calc.multiply,a1,a2))
    print(f'Time for calc multiply: {t3.timeit(100)}')

    t4 = Timer(partial(calc2.multiply,a1,a2))
    print(f'Time for calc2 multiply: {t4.timeit(100)}')

    r3 = calc.multiply(a1,a2)
    r4 = calc2.multiply(a1,a2)

    diff = find_differences(r3, r4)

    if len(diff)==0:
        print('Results for multiplication are equivalent')
    else:
        print("The following multiplication values do not match:")
        print(diff)

    t5 = Timer(partial(calc.hypotenuse,a1,a2))
    print(f'Time for calc hypotenuse: {t5.timeit(100)}')

    t6 = Timer(partial(calc2.hypotenuse,a1,a2))
    print(f'Time for calc2 hypotenuse: {t6.timeit(100)}')

    r5 = calc.hypotenuse(a1,a2)
    r6 = calc2.hypotenuse(a1,a2)

    diff = find_differences(r5, r6)

    if len(diff)==0:
        print('Results for hypotenuse are equivalent')
    else:
        print("The following hypotenuse values do not match:")
        print(diff)
