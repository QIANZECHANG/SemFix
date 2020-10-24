; ModuleID = 'program.bc'
source_filename = "program.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"bias\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @is_upward_preferred(i32 %0, i32 %1, i32 %2) #0 !dbg !7 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 %1, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 %2, i32* %7, align 4
  call void @llvm.dbg.declare(metadata i32* %7, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %8, metadata !17, metadata !DIExpression()), !dbg !18
  %9 = load i32, i32* %5, align 4, !dbg !19
  %10 = icmp ne i32 %9, 0, !dbg !19
  br i1 %10, label %11, label %13, !dbg !21

11:                                               ; preds = %3
  %12 = bitcast i32* %8 to i8*, !dbg !22
  call void @klee_make_symbolic(i8* %12, i64 4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)), !dbg !23
  br label %15, !dbg !23

13:                                               ; preds = %3
  %14 = load i32, i32* %6, align 4, !dbg !24
  store i32 %14, i32* %8, align 4, !dbg !25
  br label %15

15:                                               ; preds = %13, %11
  %16 = load i32, i32* %8, align 4, !dbg !26
  %17 = load i32, i32* %7, align 4, !dbg !28
  %18 = icmp sgt i32 %16, %17, !dbg !29
  br i1 %18, label %19, label %20, !dbg !30

19:                                               ; preds = %15
  store i32 1, i32* %4, align 4, !dbg !31
  br label %21, !dbg !31

20:                                               ; preds = %15
  store i32 0, i32* %4, align 4, !dbg !32
  br label %21, !dbg !32

21:                                               ; preds = %20, %19
  %22 = load i32, i32* %4, align 4, !dbg !33
  ret i32 %22, !dbg !33
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 !dbg !34 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !40, metadata !DIExpression()), !dbg !41
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i32* %6, metadata !44, metadata !DIExpression()), !dbg !45
  %9 = load i8**, i8*** %5, align 8, !dbg !46
  %10 = getelementptr inbounds i8*, i8** %9, i64 1, !dbg !46
  %11 = load i8*, i8** %10, align 8, !dbg !46
  %12 = call i32 @atoi(i8* %11) #4, !dbg !47
  store i32 %12, i32* %6, align 4, !dbg !45
  call void @llvm.dbg.declare(metadata i32* %7, metadata !48, metadata !DIExpression()), !dbg !49
  %13 = load i8**, i8*** %5, align 8, !dbg !50
  %14 = getelementptr inbounds i8*, i8** %13, i64 2, !dbg !50
  %15 = load i8*, i8** %14, align 8, !dbg !50
  %16 = call i32 @atoi(i8* %15) #4, !dbg !51
  store i32 %16, i32* %7, align 4, !dbg !49
  call void @llvm.dbg.declare(metadata i32* %8, metadata !52, metadata !DIExpression()), !dbg !53
  %17 = load i8**, i8*** %5, align 8, !dbg !54
  %18 = getelementptr inbounds i8*, i8** %17, i64 3, !dbg !54
  %19 = load i8*, i8** %18, align 8, !dbg !54
  %20 = call i32 @atoi(i8* %19) #4, !dbg !55
  store i32 %20, i32* %8, align 4, !dbg !53
  %21 = load i32, i32* %6, align 4, !dbg !56
  %22 = load i32, i32* %7, align 4, !dbg !57
  %23 = load i32, i32* %8, align 4, !dbg !58
  %24 = call i32 @is_upward_preferred(i32 %21, i32 %22, i32 %23), !dbg !59
  ret i32 %24, !dbg !60
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #3

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/QIANZECHANG/BuzzFuzz.git 53b432643028dcd34e8f399b2585b409c354f715)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "program.c", directory: "/home/binary/klee/test_klee")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/QIANZECHANG/BuzzFuzz.git 53b432643028dcd34e8f399b2585b409c354f715)"}
!7 = distinct !DISubprogram(name: "is_upward_preferred", scope: !1, file: !1, line: 4, type: !8, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "inhibit", arg: 1, scope: !7, file: !1, line: 4, type: !10)
!12 = !DILocation(line: 4, column: 29, scope: !7)
!13 = !DILocalVariable(name: "up_sep", arg: 2, scope: !7, file: !1, line: 4, type: !10)
!14 = !DILocation(line: 4, column: 42, scope: !7)
!15 = !DILocalVariable(name: "down_sep", arg: 3, scope: !7, file: !1, line: 4, type: !10)
!16 = !DILocation(line: 4, column: 54, scope: !7)
!17 = !DILocalVariable(name: "bias", scope: !7, file: !1, line: 5, type: !10)
!18 = !DILocation(line: 5, column: 9, scope: !7)
!19 = !DILocation(line: 6, column: 9, scope: !20)
!20 = distinct !DILexicalBlock(scope: !7, file: !1, line: 6, column: 9)
!21 = !DILocation(line: 6, column: 9, scope: !7)
!22 = !DILocation(line: 8, column: 21, scope: !20)
!23 = !DILocation(line: 8, column: 2, scope: !20)
!24 = !DILocation(line: 10, column: 14, scope: !20)
!25 = !DILocation(line: 10, column: 13, scope: !20)
!26 = !DILocation(line: 11, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !7, file: !1, line: 11, column: 9)
!28 = !DILocation(line: 11, column: 14, scope: !27)
!29 = !DILocation(line: 11, column: 13, scope: !27)
!30 = !DILocation(line: 11, column: 9, scope: !7)
!31 = !DILocation(line: 12, column: 9, scope: !27)
!32 = !DILocation(line: 14, column: 2, scope: !27)
!33 = !DILocation(line: 15, column: 1, scope: !7)
!34 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 16, type: !35, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{!10, !10, !37}
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!40 = !DILocalVariable(name: "argc", arg: 1, scope: !34, file: !1, line: 16, type: !10)
!41 = !DILocation(line: 16, column: 14, scope: !34)
!42 = !DILocalVariable(name: "argv", arg: 2, scope: !34, file: !1, line: 16, type: !37)
!43 = !DILocation(line: 16, column: 25, scope: !34)
!44 = !DILocalVariable(name: "a", scope: !34, file: !1, line: 17, type: !10)
!45 = !DILocation(line: 17, column: 9, scope: !34)
!46 = !DILocation(line: 17, column: 16, scope: !34)
!47 = !DILocation(line: 17, column: 11, scope: !34)
!48 = !DILocalVariable(name: "b", scope: !34, file: !1, line: 18, type: !10)
!49 = !DILocation(line: 18, column: 9, scope: !34)
!50 = !DILocation(line: 18, column: 16, scope: !34)
!51 = !DILocation(line: 18, column: 11, scope: !34)
!52 = !DILocalVariable(name: "c", scope: !34, file: !1, line: 19, type: !10)
!53 = !DILocation(line: 19, column: 9, scope: !34)
!54 = !DILocation(line: 19, column: 16, scope: !34)
!55 = !DILocation(line: 19, column: 11, scope: !34)
!56 = !DILocation(line: 20, column: 32, scope: !34)
!57 = !DILocation(line: 20, column: 34, scope: !34)
!58 = !DILocation(line: 20, column: 36, scope: !34)
!59 = !DILocation(line: 20, column: 12, scope: !34)
!60 = !DILocation(line: 20, column: 5, scope: !34)
