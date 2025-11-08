import torch

# print(5.25 * 6)
 
a = torch.tensor(5.25, dtype=torch.float32)
print("a.dtype =", a.dtype)

# b = torch.tensor(6, dtype=torch.float32)
b = torch.tensor(6)
b = b.type(torch.float32)
print("b.dtype =", b.dtype)

out = a * b
print("out.dtype =", out.dtype)
