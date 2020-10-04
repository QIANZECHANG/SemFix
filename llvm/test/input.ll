; ModuleID = 'input.c'
source_filename = "input.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"1\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"-1\0A\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"0\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 !dbg !7 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !14, metadata !DIExpression()), !dbg !15
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %6, metadata !18, metadata !DIExpression()), !dbg !19
  %8 = load i8**, i8*** %5, align 8, !dbg !20
  %9 = getelementptr inbounds i8*, i8** %8, i64 1, !dbg !20
  %10 = load i8*, i8** %9, align 8, !dbg !20
  %11 = call i32 @atoi(i8* %10) #4, !dbg !21
  store i32 %11, i32* %6, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata i32* %7, metadata !22, metadata !DIExpression()), !dbg !23
  %12 = load i8**, i8*** %5, align 8, !dbg !24
  %13 = getelementptr inbounds i8*, i8** %12, i64 2, !dbg !24
  %14 = load i8*, i8** %13, align 8, !dbg !24
  %15 = call i32 @atoi(i8* %14) #4, !dbg !25
  store i32 %15, i32* %7, align 4, !dbg !23
  %16 = load i32, i32* %6, align 4, !dbg !26
  %17 = load i32, i32* %7, align 4, !dbg !28
  %18 = add nsw i32 %16, %17, !dbg !29
  %19 = icmp sgt i32 %18, 10, !dbg !30
  br i1 %19, label %20, label %22, !dbg !31

20:                                               ; preds = %2
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0)), !dbg !32
  br label %32, !dbg !34

22:                                               ; preds = %2
  %23 = load i32, i32* %6, align 4, !dbg !35
  %24 = load i32, i32* %7, align 4, !dbg !37
  %25 = add nsw i32 %23, %24, !dbg !38
  %26 = icmp slt i32 %25, 5, !dbg !39
  br i1 %26, label %27, label %29, !dbg !40

27:                                               ; preds = %22
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)), !dbg !41
  br label %31, !dbg !43

29:                                               ; preds = %22
  %30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0)), !dbg !44
  br label %31

31:                                               ; preds = %29, %27
  br label %32

32:                                               ; preds = %31, %20
  ret i32 0, !dbg !46
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #2

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 (https://github.com/QIANZECHANG/BuzzFuzz.git 53b432643028dcd34e8f399b2585b409c354f715)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "input.c", directory: "/home/binary/LLVM/test")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 (https://github.com/QIANZECHANG/BuzzFuzz.git 53b432643028dcd34e8f399b2585b409c354f715)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !8, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "argc", arg: 1, scope: !7, file: !1, line: 3, type: !10)
!15 = !DILocation(line: 3, column: 14, scope: !7)
!16 = !DILocalVariable(name: "argv", arg: 2, scope: !7, file: !1, line: 3, type: !11)
!17 = !DILocation(line: 3, column: 25, scope: !7)
!18 = !DILocalVariable(name: "a", scope: !7, file: !1, line: 4, type: !10)
!19 = !DILocation(line: 4, column: 9, scope: !7)
!20 = !DILocation(line: 4, column: 16, scope: !7)
!21 = !DILocation(line: 4, column: 11, scope: !7)
!22 = !DILocalVariable(name: "b", scope: !7, file: !1, line: 5, type: !10)
!23 = !DILocation(line: 5, column: 9, scope: !7)
!24 = !DILocation(line: 5, column: 16, scope: !7)
!25 = !DILocation(line: 5, column: 11, scope: !7)
!26 = !DILocation(line: 6, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !7, file: !1, line: 6, column: 8)
!28 = !DILocation(line: 6, column: 10, scope: !27)
!29 = !DILocation(line: 6, column: 9, scope: !27)
!30 = !DILocation(line: 6, column: 11, scope: !27)
!31 = !DILocation(line: 6, column: 8, scope: !7)
!32 = !DILocation(line: 7, column: 9, scope: !33)
!33 = distinct !DILexicalBlock(scope: !27, file: !1, line: 6, column: 15)
!34 = !DILocation(line: 8, column: 5, scope: !33)
!35 = !DILocation(line: 8, column: 14, scope: !36)
!36 = distinct !DILexicalBlock(scope: !27, file: !1, line: 8, column: 14)
!37 = !DILocation(line: 8, column: 16, scope: !36)
!38 = !DILocation(line: 8, column: 15, scope: !36)
!39 = !DILocation(line: 8, column: 17, scope: !36)
!40 = !DILocation(line: 8, column: 14, scope: !27)
!41 = !DILocation(line: 9, column: 9, scope: !42)
!42 = distinct !DILexicalBlock(scope: !36, file: !1, line: 8, column: 20)
!43 = !DILocation(line: 10, column: 5, scope: !42)
!44 = !DILocation(line: 11, column: 9, scope: !45)
!45 = distinct !DILexicalBlock(scope: !36, file: !1, line: 10, column: 10)
!46 = !DILocation(line: 13, column: 5, scope: !7)
