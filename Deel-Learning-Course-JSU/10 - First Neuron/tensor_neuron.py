import torch
from torch import nn

# X = torch.randn(1, 1)
X = torch.tensor([
    [18.0]
])
print("X.shape =", X.shape)
print("X =", X)

model = nn.Linear(1, 1)
print("model =", model)
print("model.bias =", model.bias)
print("model.weight =", model.weight)

y_pred = model(X)
print("y_pred =", y_pred)