; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%f \00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @pai(i32 %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  store i32 %0, i32* %2, align 4
  store i32 1, i32* %3, align 4
  store float 0.000000e+00, float* %4, align 4
  store float 0.000000e+00, float* %5, align 4
  store float 1.000000e+00, float* %6, align 4
  br label %7

7:                                                ; preds = %29, %1
  %8 = load float, float* %6, align 4
  %9 = load i32, i32* %2, align 4
  %10 = sitofp i32 %9 to float
  %11 = fcmp ole float %8, %10
  br i1 %11, label %12, label %32

12:                                               ; preds = %7
  %13 = load i32, i32* %3, align 4
  %14 = srem i32 %13, 2
  %15 = icmp eq i32 %14, 1
  br i1 %15, label %16, label %21

16:                                               ; preds = %12
  %17 = load float, float* %6, align 4
  %18 = fdiv float 1.000000e+00, %17
  %19 = load float, float* %4, align 4
  %20 = fadd float %19, %18
  store float %20, float* %4, align 4
  br label %26

21:                                               ; preds = %12
  %22 = load float, float* %6, align 4
  %23 = fdiv float 1.000000e+00, %22
  %24 = load float, float* %4, align 4
  %25 = fsub float %24, %23
  store float %25, float* %4, align 4
  br label %26

26:                                               ; preds = %21, %16
  %27 = load i32, i32* %3, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %3, align 4
  br label %29

29:                                               ; preds = %26
  %30 = load float, float* %6, align 4
  %31 = fadd float %30, 2.000000e+00
  store float %31, float* %6, align 4
  br label %7

32:                                               ; preds = %7
  %33 = load float, float* %4, align 4
  %34 = fmul float 4.000000e+00, %33
  store float %34, float* %5, align 4
  %35 = load float, float* %5, align 4
  ret float %35
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca float, align 4
  store i32 0, i32* %1, align 4
  store i32 0, i32* %2, align 4
  store i32 1, i32* %3, align 4
  store i32 1, i32* %4, align 4
  %8 = call float @pai(i32 2000)
  store float %8, float* %7, align 4
  %9 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %6)
  %10 = load i32, i32* %2, align 4
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %10)
  %12 = load i32, i32* %3, align 4
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %12)
  br label %14

14:                                               ; preds = %18, %0
  %15 = load i32, i32* %4, align 4
  %16 = load i32, i32* %6, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %28

18:                                               ; preds = %14
  %19 = load i32, i32* %3, align 4
  store i32 %19, i32* %5, align 4
  %20 = load i32, i32* %2, align 4
  %21 = load i32, i32* %3, align 4
  %22 = add nsw i32 %20, %21
  store i32 %22, i32* %3, align 4
  %23 = load i32, i32* %3, align 4
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %23)
  %25 = load i32, i32* %5, align 4
  store i32 %25, i32* %2, align 4
  %26 = load i32, i32* %4, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %4, align 4
  br label %14

28:                                               ; preds = %14
  %29 = load float, float* %7, align 4
  %30 = fpext float %29 to double
  %31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), double %30)
  ret i32 0
}

declare dso_local i32 @__isoc99_scanf(i8*, ...) #1

declare dso_local i32 @printf(i8*, ...) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
