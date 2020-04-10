/*
 * Copyright (c) 2020, NVIDIA CORPORATION.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#pragma once

#include <cudf/types.hpp>

/**
 * @file list_view.cuh
 * @brief Class definition for cudf::list_view.
 */

namespace cudf {

class list_view {
public:

  /**
   * @brief Default constructor represents an empty list.
   */
  __host__ __device__ list_view();
  
  list_view(const list_view&) = default;
  list_view(list_view&&) = default;
  ~list_view() = default;
  list_view& operator=(const list_view&) = default;
  list_view& operator=(list_view&&) = default;  

  // construct object from type
  // CUDA_HOST_DEVICE_CALLABLE constexpr list_view(int v){}    

  /**
   * @brief Returns true if rhs matches this list exactly.
   */
  __device__ bool operator==(const list_view& rhs) const;
  /**
   * @brief Returns true if rhs does not match this list.
   */
  __device__ bool operator!=(const list_view& rhs) const;
  /**
   * @brief Returns true if this list is ordered before rhs.
   */
  __device__ bool operator<(const list_view& rhs) const;
  /**
   * @brief Returns true if rhs is ordered before this list.
   */
  __device__ bool operator>(const list_view& rhs) const;
  /**
   * @brief Returns true if this list matches or is ordered before rhs.
   */
  __device__ bool operator<=(const list_view& rhs) const;
  /**
   * @brief Returns true if rhs matches or is ordered before this list.
   */
  __device__ bool operator>=(const list_view& rhs) const;

};

} // namespace cudf

#include "./list_view.inl"
