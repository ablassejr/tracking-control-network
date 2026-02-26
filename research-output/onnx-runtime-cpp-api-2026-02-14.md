# Research Report: ONNX Runtime C++ API

**Date:** 2026-02-14  
**Query:** ONNX Runtime C++ API examples, tutorials, and implementation patterns  
**Researcher:** Ablasse Kingcaid-Ouedraogo (CAHSI REU, Texas A&M University -- Victoria)

---

## Executive Summary

ONNX Runtime is Microsoft's production-grade, cross-platform inference engine for neural networks exported in the ONNX format. The C++ API is a **header-only, thin wrapper** over the stable C API, providing RAII-based memory management and exception-based error handling. This report consolidates findings from official documentation, community tutorials, performance benchmarks, and academic literature to provide a comprehensive reference for deploying neural network controllers using ONNX Runtime in C++. Key findings include: (1) a well-documented two-phase initialization-inference workflow, (2) significant performance gains (up to 83%) through combined optimizations, (3) thread-safe concurrent inference on shared sessions, and (4) active academic research on ONNX-based neural network deployment for real-time control systems.

---

## 1. Architecture and API Design

### 1.1 API Layering

The ONNX Runtime C++ API follows a layered architecture:

```
[ C++ Header-Only Wrappers (Ort:: namespace) ]
           |
[ Stable C API (OrtApi struct) ]
           |
[ ONNX Runtime Core Engine ]
```

- **Entry point:** `OrtGetApiBase()` returns `OrtApiBase`, which contains `GetApi()` to retrieve the versioned `OrtApi` function table.
- **C++ purpose:** "Turn the C style return value error codes into C++ exceptions, and to automate memory management through standard C++ RAII principles." (Source: Official docs)
- **Header:** `#include <onnxruntime_cxx_api.h>` -- single header for all C++ wrapper classes.

### 1.2 Core Classes

| Class | Purpose |
|-------|---------|
| `Ort::Env` | Global runtime environment (logging, threading) |
| `Ort::SessionOptions` | Configuration for session creation |
| `Ort::Session` | Model loading and inference execution |
| `Ort::MemoryInfo` | Describes memory location and allocator type |
| `Ort::Value` | Tensor container for inputs/outputs |
| `Ort::AllocatorWithDefaultOptions` | Default CPU allocator |
| `Ort::IoBinding` | Pre-bind inputs/outputs for optimized memory |
| `Ort::RunOptions` | Per-inference configuration |
| `Ort::Exception` | Error type thrown by all C++ methods |

### 1.3 Session Constructors (7 Overloads)

```cpp
Session(std::nullptr_t);                                              // Empty/uninitialized
Session(OrtSession* p);                                               // C API interop
Session(const Env&, const char* model_path, const SessionOptions&);   // From file
Session(const Env&, const char* model_path, const SessionOptions&,    // From file + prepacked weights
        OrtPrepackedWeightsContainer*);
Session(const Env&, const void* model_data, size_t len,               // From memory buffer
        const SessionOptions&);
Session(const Env&, const void* model_data, size_t len,               // From memory + prepacked weights
        const SessionOptions&, OrtPrepackedWeightsContainer*);
Session(const Env&, const Model& model, const SessionOptions&);       // From OrtModel editor
```

### 1.4 Key Session Methods

- `Run()` -- Three variations: returns `vector<Value>`, populates user-provided array, or accepts `IoBinding`
- `RunAsync()` -- Asynchronous execution with callback
- `GetInputCount()`, `GetOutputCount()` -- Query model topology
- `GetInputNames()`, `GetOutputNames()` -- Retrieve node names
- `GetInputTypeInfo()`, `GetOutputTypeInfo()` -- Type and shape metadata
- `GetModelMetadata()` -- Model metadata access
- `EndProfilingAllocated()` -- Retrieve profiling results

---

## 2. Core Implementation Patterns

### 2.1 Minimal Inference Example

```cpp
#include <onnxruntime_cxx_api.h>
#include <vector>
#include <iostream>

int main() {
    // Phase 1: Initialization
    Ort::Env env(ORT_LOGGING_LEVEL_WARNING, "example");
    Ort::SessionOptions session_options;
    session_options.SetIntraOpNumThreads(1);
    session_options.SetGraphOptimizationLevel(GraphOptimizationLevel::ORT_ENABLE_ALL);

    Ort::Session session(env, "model.onnx", session_options);

    // Query model info
    Ort::AllocatorWithDefaultOptions allocator;
    size_t num_inputs = session.GetInputCount();
    size_t num_outputs = session.GetOutputCount();

    // Phase 2: Inference
    std::vector<float> input_data(3 * 224 * 224, 0.5f);
    std::vector<int64_t> input_shape = {1, 3, 224, 224};

    Ort::MemoryInfo memory_info = Ort::MemoryInfo::CreateCpu(
        OrtAllocatorType::OrtArenaAllocator, OrtMemType::OrtMemTypeDefault);

    Ort::Value input_tensor = Ort::Value::CreateTensor<float>(
        memory_info, input_data.data(), input_data.size(),
        input_shape.data(), input_shape.size());

    const char* input_names[] = {"input"};
    const char* output_names[] = {"output"};

    auto output_tensors = session.Run(
        Ort::RunOptions{nullptr},
        input_names, &input_tensor, 1,
        output_names, 1);

    float* output_data = output_tensors[0].GetTensorMutableData<float>();
    return 0;
}
```

### 2.2 Complete Model Explorer Pattern (Official Microsoft Example)

```cpp
#include <onnxruntime_cxx_api.h>
#include <algorithm>
#include <cassert>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>

std::string print_shape(const std::vector<std::int64_t>& v) {
    std::stringstream ss("");
    for (std::size_t i = 0; i < v.size() - 1; i++) ss << v[i] << "x";
    ss << v[v.size() - 1];
    return ss.str();
}

int calculate_product(const std::vector<std::int64_t>& v) {
    int total = 1;
    for (auto& i : v) total *= static_cast<int>(i);
    return total;
}

template <typename T>
Ort::Value vec_to_tensor(std::vector<T>& data, const std::vector<std::int64_t>& shape) {
    Ort::MemoryInfo mem_info =
        Ort::MemoryInfo::CreateCpu(OrtAllocatorType::OrtArenaAllocator, OrtMemType::OrtMemTypeDefault);
    auto tensor = Ort::Value::CreateTensor<T>(mem_info, data.data(), data.size(), shape.data(), shape.size());
    return tensor;
}

int main(int argc, char* argv[]) {
    if (argc != 2) {
        std::cout << "Usage: ./model-explorer <model.onnx>" << std::endl;
        return -1;
    }

    // Setup
    Ort::Env env(ORT_LOGGING_LEVEL_WARNING, "example-model-explorer");
    Ort::SessionOptions session_options;
    Ort::Session session(env, argv[1], session_options);

    // Inspect inputs
    Ort::AllocatorWithDefaultOptions allocator;
    std::vector<std::string> input_names;
    std::vector<std::int64_t> input_shapes;
    for (std::size_t i = 0; i < session.GetInputCount(); i++) {
        input_names.emplace_back(session.GetInputNameAllocated(i, allocator).get());
        input_shapes = session.GetInputTypeInfo(i).GetTensorTypeAndShapeInfo().GetShape();
        std::cout << "\t" << input_names.at(i) << " : " << print_shape(input_shapes) << std::endl;
    }

    // Handle dynamic shapes
    for (auto& s : input_shapes) {
        if (s < 0) s = 1;
    }

    // Inspect outputs
    std::vector<std::string> output_names;
    for (std::size_t i = 0; i < session.GetOutputCount(); i++) {
        output_names.emplace_back(session.GetOutputNameAllocated(i, allocator).get());
        auto output_shapes = session.GetOutputTypeInfo(i).GetTensorTypeAndShapeInfo().GetShape();
        std::cout << "\t" << output_names.at(i) << " : " << print_shape(output_shapes) << std::endl;
    }

    // Create input tensor with random data
    auto total_elements = calculate_product(input_shapes);
    std::vector<float> input_tensor_values(total_elements);
    std::generate(input_tensor_values.begin(), input_tensor_values.end(),
                  [&] { return static_cast<float>(rand() % 255); });
    std::vector<Ort::Value> input_tensors;
    input_tensors.emplace_back(vec_to_tensor<float>(input_tensor_values, input_shapes));

    // Convert names for C API
    std::vector<const char*> input_names_char(input_names.size(), nullptr);
    std::transform(input_names.begin(), input_names.end(), input_names_char.begin(),
                   [](const std::string& str) { return str.c_str(); });
    std::vector<const char*> output_names_char(output_names.size(), nullptr);
    std::transform(output_names.begin(), output_names.end(), output_names_char.begin(),
                   [](const std::string& str) { return str.c_str(); });

    // Run inference
    try {
        auto output_tensors = session.Run(Ort::RunOptions{nullptr},
            input_names_char.data(), input_tensors.data(), input_names_char.size(),
            output_names_char.data(), output_names_char.size());
        assert(output_tensors.size() == output_names.size() && output_tensors[0].IsTensor());
    } catch (const Ort::Exception& exception) {
        std::cout << "ERROR: " << exception.what() << std::endl;
        exit(-1);
    }
}
```

### 2.3 MNIST Digit Recognition Pattern (Official Tutorial)

```cpp
class MNIST {
    Ort::Env env{ORT_LOGGING_LEVEL_WARNING, "test"};
    Ort::Session session_{env, ORT_TSTR("model.onnx"), Ort::SessionOptions{nullptr}};

    std::array<float, 28 * 28> input_image_{};
    std::array<float, 10> results_{};
    std::array<int64_t, 4> input_shape_{1, 1, 28, 28};
    std::array<int64_t, 2> output_shape_{1, 10};

    Ort::Value input_tensor_{nullptr};
    Ort::Value output_tensor_{nullptr};
    int result_{0};

public:
    MNIST() {
        auto allocator_info = Ort::AllocatorInfo::CreateCpu(OrtDeviceAllocator, OrtMemTypeCPU);
        input_tensor_ = Ort::Value::CreateTensor<float>(allocator_info,
            input_image_.data(), input_image_.size(),
            input_shape_.data(), input_shape_.size());
        output_tensor_ = Ort::Value::CreateTensor<float>(allocator_info,
            results_.data(), results_.size(),
            output_shape_.data(), output_shape_.size());
    }

    int Run() {
        const char* input_names[] = {"Input3"};
        const char* output_names[] = {"Plus214_Output_0"};

        session_.Run(Ort::RunOptions{nullptr}, input_names,
            &input_tensor_, 1, output_names, &output_tensor_, 1);

        result_ = std::distance(results_.begin(),
            std::max_element(results_.begin(), results_.end()));
        return result_;
    }
};
```

Key pattern: **Pre-allocated member buffers** -- input and output tensors wrap pre-existing arrays, avoiding per-inference allocation.

### 2.4 IoBinding Pattern (Optimized Memory)

```cpp
Ort::Env env;
Ort::Session session(env, model_path, session_options);
Ort::IoBinding io_binding{session};

// Bind input
auto input_tensor = Ort::Value::CreateTensor<float>(
    memory_info, input_tensor_values.data(),
    input_tensor_size, input_node_dims.data(), 4);
io_binding.BindInput("input1", input_tensor);

// Bind output (dynamic shapes -- ORT allocates)
Ort::MemoryInfo output_mem_info{"Cuda", OrtDeviceAllocator, 0, OrtMemTypeDefault};
io_binding.BindOutput("output1", output_mem_info);

// Bind output (known shapes -- pre-allocated reusable buffer)
Ort::Allocator gpu_allocator(session, output_mem_info);
auto output_value = Ort::Value::CreateTensor(
    gpu_allocator, output_shape.data(), output_shape.size(),
    ONNX_TENSOR_ELEMENT_DATA_TYPE_FLOAT16);
io_binding.BindOutput("output1", output_mem_info);

// Run
session.Run(run_options, io_binding);
```

### 2.5 Image Preprocessing with OpenCV Integration

```cpp
cv::Mat imageBGR = cv::imread(imageFilepath, cv::ImreadModes::IMREAD_COLOR);
cv::Mat resizedImageBGR, resizedImageRGB, resizedImage, preprocessedImage;
cv::resize(imageBGR, resizedImageBGR,
           cv::Size(inputDims.at(2), inputDims.at(3)),
           cv::InterpolationFlags::INTER_CUBIC);
cv::cvtColor(resizedImageBGR, resizedImageRGB,
             cv::ColorConversionCodes::COLOR_BGR2RGB);
resizedImageRGB.convertTo(resizedImage, CV_32F, 1.0 / 255);

cv::Mat channels[3];
cv::split(resizedImage, channels);
channels[0] = (channels[0] - 0.485) / 0.229;
channels[1] = (channels[1] - 0.456) / 0.224;
channels[2] = (channels[2] - 0.406) / 0.225;
cv::merge(channels, 3, resizedImage);
cv::dnn::blobFromImage(resizedImage, preprocessedImage);

size_t inputTensorSize = vectorProduct(inputDims);
std::vector<float> inputTensorValues(inputTensorSize);
inputTensorValues.assign(preprocessedImage.begin<float>(),
                         preprocessedImage.end<float>());
```

---

## 3. Configuration and Optimization

### 3.1 Session Options Reference

```cpp
Ort::SessionOptions session_options;

// Threading
session_options.SetIntraOpNumThreads(4);   // Parallelism within operators
session_options.SetInterOpNumThreads(2);   // Parallelism across operators
session_options.SetExecutionMode(ExecutionMode::ORT_SEQUENTIAL);  // or ORT_PARALLEL

// Graph Optimization
session_options.SetGraphOptimizationLevel(GraphOptimizationLevel::ORT_ENABLE_ALL);
// Options: ORT_DISABLE_ALL, ORT_ENABLE_BASIC, ORT_ENABLE_EXTENDED, ORT_ENABLE_ALL

// Memory
session_options.EnableMemoryPattern();     // Reuse allocation patterns from first Run()
session_options.EnableCpuMemArena();       // Arena-based memory pooling

// Spinning (CPU-intensive but lower latency)
session_options.AddConfigEntry("session.intra_op.allow_spinning", "1");  // default
session_options.AddConfigEntry("session.inter_op.allow_spinning", "1");  // default

// Profiling
session_options.EnableProfiling("profile_output.json");
```

### 3.2 Execution Provider Configuration

```cpp
// CPU (default)
// No additional configuration needed

// CUDA
OrtCUDAProviderOptions cuda_options;
cuda_options.device_id = 0;
cuda_options.cudnn_conv_algo_search = OrtCudnnConvAlgoSearchExhaustive;
cuda_options.arena_extend_strategy = 0;
session_options.AppendExecutionProvider_CUDA(cuda_options);

// DirectML (Windows)
session_options.AppendExecutionProvider_DML(0);

// OpenVINO
session_options.AppendExecutionProvider_OpenVINO("CPU_FP32");

// TensorRT
OrtTensorRTProviderOptions trt_options;
trt_options.device_id = 0;
session_options.AppendExecutionProvider_TensorRT(trt_options);
```

### 3.3 Performance Benchmarks

| Optimization Technique | Inference Time (ms) | Memory (MB) | Improvement |
|----------------------|-------------------|-----------|------------|
| Base Implementation | 24.5 | 420 | Baseline |
| Thread Pool Optimization | 18.2 | 425 | 25.7% |
| Graph Optimizations | 15.6 | 380 | 36.3% |
| Memory Arena | 15.2 | 365 | 38.0% |
| CUDA Acceleration | 5.8 | 520 | 76.3% |
| **All Optimizations** | **4.2** | **480** | **82.9%** |

Source: markaicode.com benchmark for ResNet-like model on representative hardware.

### 3.4 CPU Usage vs. Latency Trade-offs

| Configuration | CPU Usage | Latency | Best Use Case |
|---|---|---|---|
| Default (spinning enabled) | 47% | 2.5ms | Low-latency requirement |
| No Spin Wait | 3% | 6ms | Moderate latency tolerance |
| Single Thread | 0.5% | 4.6ms | Resource-constrained systems |

Source: Inworld AI production benchmarks.

### 3.5 Raw Inference Latency

- **GPU (CUDA, NVIDIA RTX 2080 Ti):** 0.98 ms
- **CPU (Intel i9-9900K):** 7.45 ms

Source: Lei Mao's ONNX Runtime Inference benchmark.

---

## 4. Thread Safety and Concurrency

### 4.1 Thread Safety Guarantees

- **`Ort::Session::Run()` is thread-safe** -- Multiple threads can invoke `Run()` on the same session concurrently.
- Sessions are thread-safe after construction.
- All other session methods are read-only and safe for concurrent access.
- **`Ort::Env`** should be created once and shared globally.

### 4.2 Custom Thread Pool (Advanced)

```cpp
Ort::SessionOptions session_options;
session_options.SetCustomCreateThreadFn(CreateThreadCustomized);
session_options.SetCustomThreadCreationOptions(&custom_options);
session_options.SetCustomJoinThreadFn(JoinThreadCustomized);
```

### 4.3 NUMA Optimization

Thread affinity pinning to specific NUMA nodes shows approximately **20% performance improvement** over distributed cross-node execution.

```cpp
session_options.SetIntraOpNumThreads(8);
session_options.AddConfigEntry(
    "session.intra_op_thread_affinities",
    "3,4;5,6;7,8;9,10;11,12;13,14;15,16");
```

---

## 5. Memory Management Patterns

### 5.1 RAII and Automatic Cleanup

All C++ wrapper classes inherit from `detail::Base<T>` which provides automatic cleanup via destructors. No manual memory management is needed when using the C++ API.

### 5.2 Pre-Allocated Buffer Reuse (Recommended for Real-Time)

```cpp
std::vector<float> input_buffer(input_size);
std::vector<float> output_buffer(output_size);

Ort::Value input_tensor = Ort::Value::CreateTensor<float>(
    memory_info, input_buffer.data(), input_buffer.size(),
    input_shape.data(), input_shape.size());

// Reuse across multiple inference calls
for (const auto& sample : data) {
    std::copy(sample.begin(), sample.end(), input_buffer.begin());
    auto output = session.Run(Ort::RunOptions{nullptr},
        &input_name, &input_tensor, 1, &output_name, 1);
}
```

### 5.3 Shared Allocator Between Sessions

For multi-model deployments, share the arena allocator to reduce memory:

```cpp
// Register shared allocator with environment
env.CreateAndRegisterAllocator(allocator_info, arena_config);

// Enable for each session
session_options.AddConfigEntry("session.use_env_allocators", "1");
```

### 5.4 Shared Initializers

When multiple models share the same weights:

```cpp
Ort::SessionOptions shared_options;
shared_options.AddInitializer("shared_weights", weight_tensor);

// Create multiple sessions with same options
Ort::Session session1(env, "model1.onnx", shared_options);
Ort::Session session2(env, "model2.onnx", shared_options);
```

### 5.5 Arena vs. No Arena Trade-off

- **`EnableCpuMemArena()` (default):** Memory is pooled and never returned to OS. Better latency. Higher baseline memory.
- **`DisableCpuMemArena()`:** Lower memory footprint. Higher inference latency. Recommended for memory-constrained environments.

---

## 6. Error Handling

### 6.1 C++ Exception Pattern

```cpp
try {
    Ort::Session session(env, model_path, session_options);
    auto output = session.Run(Ort::RunOptions{nullptr},
        input_names, &input_tensor, 1, output_names, 1);
} catch (const Ort::Exception& e) {
    std::cerr << "ONNX Runtime error: " << e.what() << std::endl;
    OrtErrorCode code = e.GetOrtErrorCode();
    // Handle specific error codes
}
```

### 6.2 C API Error Pattern

```c
OrtStatus* status = OrtApi->CreateSession(env, model_path, options, &session);
if (status != nullptr) {
    const char* msg = OrtApi->GetErrorMessage(status);
    OrtApi->ReleaseStatus(status);
}
```

### 6.3 Key C API Guidelines

1. **No cleanup on error:** Failed API calls leave no residual state. Caller only needs to free `OrtStatus`.
2. **No exception propagation across C/C++ boundary:** All C++ exceptions are converted to `OrtStatus` at boundaries.
3. **All allocations use `OrtAllocator`:** Enables custom allocator usage.
4. **All strings are UTF-8 encoded.**
5. **Release functions return `void`:** Enables exception-safe C++ wrappers.

### 6.4 Exceptions-Disabled Mode

When compiled with `ORT_NO_EXCEPTIONS`, the API calls `std::abort()` on error instead of throwing. This prevents graceful error recovery and is generally not recommended for production.

---

## 7. CMake Build Integration

### 7.1 Custom Config File Approach (Recommended)

Create `onnxruntimeConfig.cmake`:

```cmake
include(FindPackageHandleStandardArgs)

get_filename_component(CMAKE_CURRENT_LIST_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
get_filename_component(onnxruntime_INSTALL_PREFIX "${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)

set(onnxruntime_INCLUDE_DIRS ${onnxruntime_INSTALL_PREFIX}/include)
set(onnxruntime_LIBRARIES onnxruntime)
set(onnxruntime_CXX_FLAGS "")

find_library(onnxruntime_LIBRARY onnxruntime
    PATHS "${onnxruntime_INSTALL_PREFIX}/lib")

add_library(onnxruntime SHARED IMPORTED)
set_property(TARGET onnxruntime PROPERTY IMPORTED_LOCATION "${onnxruntime_LIBRARY}")
set_property(TARGET onnxruntime PROPERTY INTERFACE_INCLUDE_DIRECTORIES "${onnxruntime_INCLUDE_DIRS}")
set_property(TARGET onnxruntime PROPERTY INTERFACE_COMPILE_OPTIONS "${onnxruntime_CXX_FLAGS}")

find_package_handle_standard_args(onnxruntime DEFAULT_MSG onnxruntime_LIBRARY onnxruntime_INCLUDE_DIRS)
```

Then in your project:

```cmake
cmake_minimum_required(VERSION 3.14)
project(onnx_inference)

set(CMAKE_CXX_STANDARD 17)

find_package(onnxruntime REQUIRED)
add_executable(inference main.cpp)
target_link_libraries(inference ${onnxruntime_LIBRARIES})
```

### 7.2 Manual Path Approach

```cmake
set(ONNX_RUNTIME_PATH "/path/to/onnxruntime")

include_directories(${ONNX_RUNTIME_PATH}/include)
link_directories(${ONNX_RUNTIME_PATH}/lib)

add_executable(inference main.cpp)
target_link_libraries(inference onnxruntime)
```

### 7.3 Package Manager Integration

- **Conan:** `conan install onnxruntime` -- Available via Conan Center.
- **vcpkg:** Check for port in `cmake/vcpkg/vcpkg-ports` directory.
- **NuGet:** Primary distribution method for Windows:
  - `Microsoft.ML.OnnxRuntime` (CPU)
  - `Microsoft.ML.OnnxRuntime.Gpu` (CUDA)
  - `Microsoft.ML.OnnxRuntime.DirectML` (DirectML)

### 7.4 Platform Requirements

- C++17 or later
- Pre-built binaries available as .zip/.tgz from GitHub releases
- Build from source with `--build_shared_lib` for shared library
- Use `--use_cuda` flag for GPU support when building from source

---

## 8. Production Deployment Patterns

### 8.1 Model Manager with Caching

```cpp
class ModelManager {
private:
    Ort::Env env{ORT_LOGGING_LEVEL_WARNING, "model-manager"};
    std::unordered_map<std::string, std::unique_ptr<Ort::Session>> model_cache;
    std::mutex cache_mutex;

    Ort::SessionOptions createSessionOptions() {
        Ort::SessionOptions options;
        options.SetIntraOpNumThreads(4);
        options.SetGraphOptimizationLevel(GraphOptimizationLevel::ORT_ENABLE_ALL);
        return options;
    }

public:
    Ort::Session* getModel(const std::string& model_path) {
        std::lock_guard<std::mutex> lock(cache_mutex);

        auto it = model_cache.find(model_path);
        if (it != model_cache.end()) {
            return it->second.get();
        }

        auto options = createSessionOptions();
        auto model = std::make_unique<Ort::Session>(env, model_path.c_str(), options);
        auto* model_ptr = model.get();
        model_cache[model_path] = std::move(model);
        return model_ptr;
    }
};
```

### 8.2 Warm-Up Pattern (Critical for Real-Time)

```cpp
void warmUpModel(Ort::Session& session, const std::vector<int64_t>& input_shape) {
    Ort::MemoryInfo mem_info = Ort::MemoryInfo::CreateCpu(
        OrtArenaAllocator, OrtMemTypeDefault);

    std::vector<float> dummy_input(calculateProduct(input_shape), 0.0f);
    Ort::Value input_tensor = Ort::Value::CreateTensor<float>(
        mem_info, dummy_input.data(), dummy_input.size(),
        input_shape.data(), input_shape.size());

    const char* input_names[] = {"input"};
    const char* output_names[] = {"output"};

    // Run 3-5 warm-up inferences
    for (int i = 0; i < 5; ++i) {
        session.Run(Ort::RunOptions{nullptr},
            input_names, &input_tensor, 1, output_names, 1);
    }
}
```

### 8.3 Edge Device Optimization

```cpp
session_options.EnableMemoryPattern();
session_options.DisableCpuMemArena();  // Trade latency for memory savings
session_options.SetIntraOpNumThreads(2);  // Restrict for limited cores
session_options.AddConfigEntry("session.intra_op.allow_spinning", "0");  // Save power
```

### 8.4 Profiling Configuration

```cpp
session_options.EnableProfiling("profile_file.json");
Ort::Session session(env, model_path, session_options);

// ... run inference ...

Ort::AllocatorWithDefaultOptions allocator;
const char* profile_file = session.EndProfiling(allocator);
std::cout << "Profiling data saved to: " << profile_file << std::endl;
```

---

## 9. Control System Integration

### 9.1 Recommended Architecture for Real-Time Control

```
[ Sensor Data ] --> [ Preprocessing ] --> [ ONNX Runtime Inference ] --> [ Control Output ]
                                                   |
                                          [ Pre-allocated Buffers ]
                                          [ Warm-up at Init ]
                                          [ Single Thread ]
```

Key recommendations for control system deployment:

1. **Pre-allocate all buffers** at initialization, never during the control loop.
2. **Warm up the model** with dummy inferences before the control loop starts.
3. **Use single-thread execution** (`SetIntraOpNumThreads(1)`) for deterministic latency.
4. **Disable spinning** to avoid CPU contention with control system threads.
5. **Use IoBinding** to eliminate copy overhead when inputs are already in device memory.
6. **Enable memory patterns** for consistent allocation across inference calls.

### 9.2 Tracking Control Neural Network Deployment Pattern

For the specific use case of tracking control neural networks (relevant to CAHSI REU research):

```cpp
class TrackingController {
    Ort::Env env_{ORT_LOGGING_LEVEL_ERROR, "tracking-controller"};
    Ort::Session session_{nullptr};

    // Pre-allocated buffers
    std::vector<float> state_input_;       // e.g., [x, y, theta, v, ...]
    std::vector<float> control_output_;    // e.g., [u1, u2, ...]
    std::vector<int64_t> input_shape_;
    std::vector<int64_t> output_shape_;

    Ort::Value input_tensor_{nullptr};
    Ort::Value output_tensor_{nullptr};

public:
    TrackingController(const char* model_path,
                       const std::vector<int64_t>& in_shape,
                       const std::vector<int64_t>& out_shape)
        : input_shape_(in_shape), output_shape_(out_shape) {

        Ort::SessionOptions opts;
        opts.SetIntraOpNumThreads(1);
        opts.SetGraphOptimizationLevel(GraphOptimizationLevel::ORT_ENABLE_ALL);
        opts.EnableMemoryPattern();
        opts.AddConfigEntry("session.intra_op.allow_spinning", "0");

        session_ = Ort::Session(env_, model_path, opts);

        // Pre-allocate
        size_t in_size = 1;
        for (auto d : input_shape_) in_size *= d;
        size_t out_size = 1;
        for (auto d : output_shape_) out_size *= d;

        state_input_.resize(in_size, 0.0f);
        control_output_.resize(out_size, 0.0f);

        auto mem = Ort::MemoryInfo::CreateCpu(OrtDeviceAllocator, OrtMemTypeCPU);
        input_tensor_ = Ort::Value::CreateTensor<float>(
            mem, state_input_.data(), state_input_.size(),
            input_shape_.data(), input_shape_.size());
        output_tensor_ = Ort::Value::CreateTensor<float>(
            mem, control_output_.data(), control_output_.size(),
            output_shape_.data(), output_shape_.size());

        // Warm up
        const char* in_name[] = {"state"};
        const char* out_name[] = {"control"};
        for (int i = 0; i < 5; ++i) {
            session_.Run(Ort::RunOptions{nullptr},
                in_name, &input_tensor_, 1, out_name, &output_tensor_, 1);
        }
    }

    const std::vector<float>& computeControl(const std::vector<float>& state) {
        std::copy(state.begin(), state.end(), state_input_.begin());

        const char* in_name[] = {"state"};
        const char* out_name[] = {"control"};
        session_.Run(Ort::RunOptions{nullptr},
            in_name, &input_tensor_, 1, out_name, &output_tensor_, 1);

        return control_output_;
    }
};
```

---

## 10. Academic Literature

### 10.1 ONNX Runtime in Real-Time Systems

**ANIRA: An Architecture for Neural Network Inference in Real-Time Audio Applications**
- Authors: Valentin Ackva, Fares Schulz (2024)
- Key finding: ONNX Runtime exhibits the lowest runtimes for stateless models compared to TensorFlow Lite and LibTorch.
- Uses static thread pool to decouple inference from real-time callbacks.
- Warns of performance anomalies during initial inferences (cold start).
- Source: IEEE International Symposium on the Internet of Sounds, 2024.

### 10.2 Neural Predictive Control

**NPC: Neural Predictive Control for Fuel-Efficient Autonomous Trucks**
- Authors: Jiaping Ren et al. (2024)
- Directly uses ONNX Runtime C++ API for inference in production autonomous truck systems.
- Achieved 2.41% fuel savings in simulation, 3.45% in real-world highway testing.
- Source: arXiv:2412.13618

### 10.3 Inference Framework Benchmarks

**Accelerating Deep Learning Inference: A Comparative Analysis of Modern Acceleration Frameworks**
- Comprehensive comparison of PyTorch, ONNX Runtime, TensorRT, Apache TVM, and JAX.
- ONNX Runtime showed up to 5x memory efficiency and 4x performance speedup vs PyTorch.
- Source: MDPI Electronics, 2025.

**Deep Learning Inference Frameworks Benchmark**
- Author: Pierrick Pochelu (2022)
- Examines how CPU-GPU configurations and framework settings affect prediction speed and memory.
- Source: arXiv:2210.04323

### 10.4 Edge and Embedded Deployment

**ONNX-to-Hardware Design Flow for Adaptive Neural-Network Accelerators on FPGAs**
- Authors: Federico Manca, Francesco Ratto (2023)
- Enables inference of quantized ONNX models on FPGAs with approximation techniques.
- Source: arXiv:2309.13321

**Dynamic DNNs and Runtime Management for Efficient Inference on Mobile/Embedded Devices**
- Survey of techniques for deploying neural networks on resource-constrained devices.
- Source: arXiv:2401.08965

### 10.5 Neural MPC for Robotics

**Real-time Neural-MPC: Deep Learning Model Predictive Control for Quadrotors**
- Authors: Tim Salzmann et al. (2023)
- 4000x larger neural network capacity vs prior work, running at 50Hz on embedded platforms.
- 82% reduction in positional tracking error.
- Source: IEEE Robotics and Automation Letters, Vol. 8, No. 4, 2023.

**DNN-based MPC Framework for Rapid Controller Implementation**
- Authors: David C. Gordon et al. (2023)
- LSTM network with fully connected layers, under 5% prediction error.
- Real-time MPC on ARM Cortex A72, completing optimization in 1.4 ms.
- Source: arXiv:2310.08392

---

## 11. Cross-Reference Analysis

### 11.1 Consensus Findings

1. **C++ is preferred for production deployment** -- All sources agree that C++ provides the lowest latency for ONNX Runtime inference.
2. **Pre-allocation is critical** -- Both official examples (MNIST) and community tutorials emphasize pre-allocating input/output buffers.
3. **Warm-up is essential** -- The ANIRA paper confirms "prolonged initial inferences" and higher real-time violations during cold starts.
4. **Thread configuration is workload-dependent** -- Single-thread is best for small models and deterministic latency; multi-thread for throughput.
5. **ONNX Runtime outperforms PyTorch for inference** -- Up to 5x memory efficiency and 4x speed improvement confirmed by multiple benchmarks.

### 11.2 Contested or Nuanced Claims

1. **Memory arena trade-off:** Enabling CPU memory arena improves latency but increases baseline memory usage. The right choice depends on whether the deployment is memory-constrained or latency-sensitive.
2. **Exception handling in production:** Some developers report that exception-based error handling makes production debugging difficult. The C API with status codes offers an alternative.
3. **Thread spinning:** Default spinning provides lower latency (2.5ms vs 6ms) but consumes 16x more CPU. No single recommendation fits all scenarios.

---

## 12. Key Insights

1. **Two-phase workflow:** ONNX Runtime inference follows a clear initialization (Env + SessionOptions + Session) and inference (CreateTensor + Run) pattern. This separation enables optimization at both stages.

2. **Performance ceiling is high:** Combined optimizations (threading + graph optimization + memory arena + CUDA) yield up to 83% improvement over baseline, with sub-millisecond GPU inference achievable.

3. **Thread safety enables concurrent inference:** `Session::Run()` is safe to call from multiple threads simultaneously, making it suitable for multi-threaded control systems without session duplication.

4. **Control system deployment is production-ready:** The NPC paper demonstrates ONNX Runtime C++ API deployed in real autonomous vehicle control, validating the pathway from PyTorch training to C++ deployment via ONNX.

5. **IoBinding eliminates copy overhead:** For GPU-based inference in control loops, IoBinding pre-positions data on the target device, eliminating the CPU-to-GPU copy during `Run()`.

---

## 13. Knowledge Gaps

1. **No official CMake config shipped** -- ONNX Runtime does not generate `onnxruntimeConfig.cmake` or `FindOnnxruntime.cmake` by default. Users must create custom CMake modules.

2. **Limited control system-specific documentation** -- While ONNX Runtime is used in control systems (NPC paper), there is no official guide for real-time control system integration.

3. **Quantization impact on control accuracy** -- While INT8/FP16 quantization is supported, its impact on control system stability and tracking error is not well-documented.

4. **CUDA stream synchronization for control** -- Documentation exists for audio (ANIRA) but not specifically for control system timing requirements.

5. **Exception-disabled deployment patterns** -- When `ORT_NO_EXCEPTIONS` is set, `std::abort()` is called on error. Robust production patterns for embedded systems without exceptions are underdocumented.

---

## 14. Sources

### Official Documentation
- [ONNX Runtime C++ Getting Started](https://onnxruntime.ai/docs/get-started/with-cpp.html)
- [ONNX Runtime API Documentation](https://onnxruntime.ai/docs/api/)
- [C/C++ Core API](https://onnxruntime.ai/docs/api/c/c_cpp_api.html)
- [Ort::Session Reference](https://onnxruntime.ai/docs/api/c/struct_ort_1_1_session.html)
- [Thread Management](https://onnxruntime.ai/docs/performance/tune-performance/threading.html)
- [IoBinding](https://onnxruntime.ai/docs/performance/tune-performance/iobinding.html)
- [MNIST C++ Tutorial](https://onnxruntime.ai/docs/tutorials/mnist_cpp.html)
- [C API Guidelines](https://github.com/microsoft/onnxruntime/blob/main/docs/C_API_Guidelines.md)

### Official Examples
- [microsoft/onnxruntime-inference-examples](https://github.com/microsoft/onnxruntime-inference-examples)
- [Model Explorer Example](https://github.com/microsoft/onnxruntime-inference-examples/blob/main/c_cxx/model-explorer/model-explorer.cpp)
- [C/C++ Tutorial Directory](https://github.com/microsoft/onnxruntime-inference-examples/tree/main/c_cxx/ort_tutorial)

### Community Tutorials
- [Lei Mao: ONNX Runtime C++ Inference](https://leimao.github.io/blog/ONNX-Runtime-CPP-Inference/)
- [Lei Mao GitHub: ONNX-Runtime-Inference](https://github.com/leimao/ONNX-Runtime-Inference)
- [C++ for ML in 2025: ONNX Runtime Integration](https://markaicode.com/cpp-machine-learning-onnx-runtime-2025/)
- [Inworld AI: Reducing CPU Usage with ONNX Runtime](https://inworld.ai/blog/reducing-cpu-usage-in-machine-learning-model-inference-with-onnx-runtime)
- [CMake Integration (GitHub Issue #3124)](https://github.com/microsoft/onnxruntime/issues/3124)

### Academic Papers
- ANIRA (2024): arXiv:2506.12665
- NPC (2024): arXiv:2412.13618
- ONNX-to-FPGA (2023): arXiv:2309.13321
- DNN-based MPC (2023): arXiv:2310.08392
- Neural-MPC for Quadrotors (2023): arXiv:2203.07747
- DL Inference Benchmark (2022): arXiv:2210.04323
- Accelerating DL Inference (2025): MDPI Electronics 14(15):2977

### Package Managers
- [Conan: onnxruntime](https://conan.io/center/recipes/onnxruntime)
- [GitHub: microsoft/onnxruntime](https://github.com/microsoft/onnxruntime)
