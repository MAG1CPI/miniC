# minC

## Project Objectives

* Implement a mini compiler for a subset of C language.

* Reference is pku-minic.

## Project Status

### Lv1. `main` 函数

实现一个能处理 main 函数和 return 语句的编译器. 你的编译器会将如下的 SysY 程序:
``` c
int main() {
  // 注释也应该被删掉哦
  return 0;
}
```
编译为对应的 Koopa IR:
``` Koopa
fun @main(): i32 {
%entry:
  ret 0
}
```