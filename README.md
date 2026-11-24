# Vector Perturbation Optimization (VPO)

Official MATLAB implementation of VPO, presented in the paper:

**Vector Perturbation Optimization: Rank-Informed Directional Search with Dynamic Perturbation for Global Optimization**

Feng Luo, Minfei Zhou, Wangqun Deng, Zhengming Qian, Sifan Liu, Qingsong Wang, and Haizhuan Yuan.

## Overview

VPO constructs search directions from the fitness ranks and relative positions of selected individuals. It combines these updates with dynamic perturbation, Lévy flight, and binomial crossover for global optimization.

This repository provides demonstrations on 32 classical benchmark functions and the CEC2017 benchmark suite.

## Getting Started

### Requirements

- MATLAB.
- A compatible CEC2017 MEX binary for the CEC2017 demonstration. The supplied `.mexw64` file targets 64-bit Windows MATLAB.

### Running the Demonstrations

Download the repository and open the relevant folder in MATLAB.

For the classical benchmark functions, open `Benchmark32` and run:

```matlab
main_benchmark32
```

For CEC2017, open `CEC2017` and run:

```matlab
main_cec2017
```

Change the function index and experiment settings at the beginning of each script. Both demonstrations display the best solution and a convergence curve.

 The CEC2017 interface handles its own input conversion.

Keep `input_data17` inside the `CEC2017` folder. If the supplied MEX binary is incompatible with your installation, compile the source from that folder using a configured C++ compiler:

```matlab
mex cec17_func.cpp
```


## Citation

If you use VPO in your research, please cite:

Feng Luo, Minfei Zhou, Wangqun Deng, Zhengming Qian, Sifan Liu, Qingsong Wang, and Haizhuan Yuan. *Vector Perturbation Optimization: Rank-Informed Directional Search with Dynamic Perturbation for Global Optimization.*

Publication details and DOI will be added when available.

## Benchmark Attribution

The benchmark code and data remain subject to their original authors' copyright notices and license terms.

## Contact

For questions, please open an issue in this repository.
