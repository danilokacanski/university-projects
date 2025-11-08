import torch

scalar = torch.tensor(10.5)
print("scalar.shape =", scalar.shape)
print("scalar.size() =", scalar.size())
print("scalar =", scalar)

vector = torch.tensor([10.5, 11.5])
print("vector.shape =", vector.shape)
print("vector =", vector)

matrix = torch.tensor([
    [10.5, 11.5],
    [15.5, 16.6],
    [18.5, 19.6]
])
print("matrix.shape =", matrix.shape)
print("matrix =", matrix)