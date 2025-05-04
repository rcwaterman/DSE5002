test = {"hello":"World"}
print(hex(id(test)))
test1 = test.copy()
print(hex(id(test1)))
test1.pop("hello")
print(test, hex(id(test)), test1, hex(id(test1)))