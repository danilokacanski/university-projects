import torch
from torch import nn

X = torch.tensor([
    [18]
], dtype=torch.float32)

model = nn.Linear(1, 1)
print("model =", model)
model.bias = nn.Parameter(
    torch.tensor([32], dtype=torch.float32)
)
print("model.bias =", model.bias)
model.weight = nn.Parameter(
    torch.tensor([[1.8]], dtype=torch.float32)
)
print("model.weight =", model.weight)

y_pred = model(X)
print("y_pred =", y_pred)