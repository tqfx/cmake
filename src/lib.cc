#include "lib.h"
#include <complex>

inline std::complex<float> complex32_to(complex32 z) {
  union {
    complex32 c;
    std::complex<float> z;
  } u = {z};
  return u.z;
}

complex32 complex32_add(complex32 _x, complex32 _y) {
  std::complex<float> x = complex32_to(_x);
  std::complex<float> y = complex32_to(_y);
  x += y;
  return {x.real(), x.imag()};
}

complex32 complex32_sub(complex32 _x, complex32 _y) {
  std::complex<float> x = complex32_to(_x);
  std::complex<float> y = complex32_to(_y);
  x -= y;
  return {x.real(), x.imag()};
}

complex32 complex32_mul(complex32 _x, complex32 _y) {
  std::complex<float> x = complex32_to(_x);
  std::complex<float> y = complex32_to(_y);
  x *= y;
  return {x.real(), x.imag()};
}

complex32 complex32_div(complex32 _x, complex32 _y) {
  std::complex<float> x = complex32_to(_x);
  std::complex<float> y = complex32_to(_y);
  x /= y;
  return {x.real(), x.imag()};
}

complex32 complex32_pow(complex32 _x, complex32 _y) {
  std::complex<float> x = complex32_to(_x);
  std::complex<float> y = complex32_to(_y);
  x = std::pow(x, y);
  return {x.real(), x.imag()};
}

complex32 complex32_sqrt(complex32 _x) {
  std::complex<float> x = complex32_to(_x);
  x = std::sqrt(x);
  return {x.real(), x.imag()};
}

complex32 complex32_log(complex32 _x) {
  std::complex<float> x = complex32_to(_x);
  x = std::log(x);
  return {x.real(), x.imag()};
}

complex32 complex32_sin(complex32 _x) {
  std::complex<float> x = complex32_to(_x);
  x = std::sin(x);
  return {x.real(), x.imag()};
}

complex32 complex32_cos(complex32 _x) {
  std::complex<float> x = complex32_to(_x);
  x = std::cos(x);
  return {x.real(), x.imag()};
}

complex32 complex32_tan(complex32 _x) {
  std::complex<float> x = complex32_to(_x);
  x = std::tan(x);
  return {x.real(), x.imag()};
}
