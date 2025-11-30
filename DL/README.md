# Deep Learning - Model Interpretability with Captum

## Overview

This repository contains practical implementations of deep learning model interpretability techniques using **Captum**, a model interpretability library for PyTorch. The project demonstrates how to visualize and understand neural network predictions through various attribution methods, specifically focusing on **Integrated Gradients** and related techniques.

## Projects

### 1. CIFAR-10 Image Classification with Interpretability

**Location:** `CIFAR 10/CIFAR_TorchVision_Interpret.ipynb`

This notebook demonstrates model interpretability on the CIFAR-10 dataset using a custom convolutional neural network.

#### Features:
- **Model Architecture:** Custom CNN based on PyTorch's CIFAR-10 tutorial
  - 2 convolutional layers with ReLU activation and max pooling
  - 3 fully connected layers
  - 10-class classification (plane, car, bird, cat, deer, dog, frog, horse, ship, truck)

- **Attribution Methods Implemented:**
  - **Saliency Maps:** Gradient-based attribution showing pixel importance
  - **Integrated Gradients (IG):** Path integral method for feature attribution
  - **Integrated Gradients + SmoothGrad:** IG with noise tunnel for robust attributions
  - **DeepLift:** Reference-based attribution method

- **Key Capabilities:**
  - Model training and evaluation on CIFAR-10
  - Visualization of attribution maps overlayed on original images
  - Comparison of different interpretability techniques
  - Convergence delta metrics for IG quality assessment

### 2. MobileNetV3 Image Classification with Integrated Gradients

**Location:** `MobileNet/`

#### Single Image Analysis
**File:** `MobileNet_TorchVision_Interpret.ipynb`

Detailed walkthrough of Integrated Gradients on pretrained MobileNetV3 Large model.

**Features:**
- Pretrained MobileNetV3 Large model from torchvision
- CalTech-101 dataset images for testing (~150MB dataset)
- Mathematical explanation of Integrated Gradients formula
- Visualization of positive and all attribution contributions
- Device-agnostic execution (MPS/CUDA/CPU support)

**Mathematical Foundation:**

The Integrated Gradients method is defined as:

$$IG_i(x) = (x_i - x'_i) \cdot \int_{\alpha=0}^{1} \frac{\partial F(x' + \alpha(x - x'))}{\partial x_i} d\alpha$$

With numerical approximation:

$$IG_i^{approx}(x) = (x_i - x'_i) \cdot \sum_{k=1}^{m} \frac{\partial F(x' + \frac{k}{m}(x - x'))}{\partial x_i} \cdot \frac{1}{m}$$

#### Batch Processing Pipeline
**File:** `MobileNet_TorchVision_Interpret_pipeline_for_more_pictures.ipynb`

Automated pipeline for processing multiple images with IG attribution.

**Features:**
- Streamlined pipeline function for batch processing
- Automated visualization generation
- Per-image prediction confidence display
- Efficient memory management for multiple inference runs

## Technical Stack

### Dependencies
- **Python:** 3.10+
- **PyTorch:** 2.2.1
- **torchvision:** 0.17.1
- **captum:** 0.6.0
- **matplotlib:** For visualization
- **numpy:** For numerical operations
- **PIL/Pillow:** For image processing

### Datasets
- **CIFAR-10:** Automatically downloaded via torchvision
- **CalTech-101:** Subset used for testing MobileNet (~150MB)

## Key Concepts

### Integrated Gradients
Integrated Gradients is an axiomatic attribution method that satisfies:
- **Sensitivity:** If a feature changes the prediction, it receives non-zero attribution
- **Implementation Invariance:** Functionally equivalent networks have identical attributions
- **Completeness:** Attributions sum to the difference between model output and baseline

### Attribution Visualization
The project uses Captum's visualization utilities to display:
- **Blended heat maps:** Overlay of attributions on original images
- **Color-coded importance:** Positive (green) and negative (red) contributions
- **Magnitude visualization:** Absolute value of gradients

## Usage

### Running CIFAR-10 Notebook
1. Open `CIFAR 10/CIFAR_TorchVision_Interpret.ipynb`
2. Set `USE_PRETRAINED_MODEL = True` to use saved model
3. Execute cells sequentially to see different attribution methods

### Running MobileNet Analysis
1. For single image: Open `MobileNet/MobileNet_TorchVision_Interpret.ipynb`
2. Update `img_path` to your image location
3. Adjust `n_steps` parameter (50-300) for integration accuracy
4. Run cells to generate attributions

### Batch Processing
1. Open `MobileNet/MobileNet_TorchVision_Interpret_pipeline_for_more_pictures.ipynb`
2. Update `img_paths` list with your image paths
3. Run the pipeline function for automated processing

## Important Notes

### Memory Management
- **Warning:** Multiple runs with high `n_steps` (>300) can consume significant memory
- Restart kernel if you encounter memory issues
- Start with lower `n_steps` values and increase gradually

### File Paths
- Use **absolute paths** for image loading to avoid relative path issues
- Update paths according to your local directory structure

### Device Compatibility
Code automatically detects and uses available compute device:
```python
device = torch.device("mps" if torch.mps.is_available() else 
                      "cuda" if torch.cuda.is_available() else "cpu")
```

## Results and Interpretability

The project enables you to:
1. **Understand model decisions:** See which pixels/regions influence predictions
2. **Debug model behavior:** Identify if model focuses on correct features
3. **Compare attribution methods:** Evaluate different interpretability techniques
4. **Validate model confidence:** Assess prediction reliability through visualization

## References

- **Captum Library:** https://captum.ai/
- **Integrated Gradients Paper:** https://arxiv.org/abs/1703.01365
- **PyTorch CIFAR-10 Tutorial:** https://pytorch.org/tutorials/beginner/blitz/cifar10_tutorial.html
- **CalTech-101 Dataset:** http://www.vision.caltech.edu/Image_Datasets/Caltech101/

## License

This project is for educational and research purposes.

## Acknowledgments

This project was developed as part of university coursework in Deep Learning, demonstrating practical applications of model interpretability techniques on standard computer vision datasets.
