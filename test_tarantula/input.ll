; ModuleID = 'input.c'
source_filename = "input.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

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
  %12 = load i32, i32* %7, align 4, !dbg !22
  store i32 %12, i32* %8, align 4, !dbg !23
  br label %15, !dbg !24

13:                                               ; preds = %3
  %14 = load i32, i32* %6, align 4, !dbg !25
  store i32 %14, i32* %8, align 4, !dbg !26
  br label %15

15:                                               ; preds = %13, %11
  %16 = load i32, i32* %8, align 4, !dbg !27
  %17 = load i32, i32* %7, align 4, !dbg !29
  %18 = icmp sgt i32 %16, %17, !dbg !30
  br i1 %18, label %19, label %20, !dbg !31

19:                                               ; preds = %15
  store i32 1, i32* %4, align 4, !dbg !32
  br label %21, !dbg !32

20:                                               ; preds = %15
  store i32 0, i32* %4, align 4, !dbg !33
  br label %21, !dbg !33

21:                                               ; preds = %20, %19
  %22 = load i32, i32* %4, align 4, !dbg !34
  ret i32 %22, !dbg !34
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 !dbg !35 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !41, metadata !DIExpression()), !dbg !42
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i32* %6, metadata !45, metadata !DIExpression()), !dbg !46
  %9 = load i8**, i8*** %5, align 8, !dbg !47
  %10 = getelementptr inbounds i8*, i8** %9, i64 1, !dbg !47
  %11 = load i8*, i8** %10, align 8, !dbg !47
  %12 = call i32 @atoi(i8* %11) #4, !dbg !48
  store i32 %12, i32* %6, align 4, !dbg !46
  call void @llvm.dbg.declare(metadata i32* %7, metadata !49, metadata !DIExpression()), !dbg !50
  %13 = load i8**, i8*** %5, align 8, !dbg !51
  %14 = getelementptr inbounds i8*, i8** %13, i64 2, !dbg !51
  %15 = load i8*, i8** %14, align 8, !dbg !51
  %16 = call i32 @atoi(i8* %15) #4, !dbg !52
  store i32 %16, i32* %7, align 4, !dbg !50
  call void @llvm.dbg.declare(metadata i32* %8, metadata !53, metadata !DIExpression()), !dbg !54
  %17 = load i8**, i8*** %5, align 8, !dbg !55
  %18 = getelementptr inbounds i8*, i8** %17, i64 3, !dbg !55
  %19 = load i8*, i8** %18, align 8, !dbg !55
  %20 = call i32 @atoi(i8* %19) #4, !dbg !56
  store i32 %20, i32* %8, align 4, !dbg !54
  %21 = load i32, i32* %6, align 4, !dbg !57
  %22 = load i32, i32* %7, align 4, !dbg !58
  %23 = load i32, i32* %8, align 4, !dbg !59
  %24 = call i32 @is_upward_preferred(i32 %21, i32 %22, i32 %23), !dbg !60
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %24), !dbg !61
  ret i32 0, !dbg !62
}

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
!7 = distinct !DISubprogram(name: "is_upward_preferred", scope: !1, file: !1, line: 3, type: !8, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "inhibit", arg: 1, scope: !7, file: !1, line: 3, type: !10)
!12 = !DILocation(line: 3, column: 29, scope: !7)
!13 = !DILocalVariable(name: "up_sep", arg: 2, scope: !7, file: !1, line: 3, type: !10)
!14 = !DILocation(line: 3, column: 42, scope: !7)
!15 = !DILocalVariable(name: "down_sep", arg: 3, scope: !7, file: !1, line: 3, type: !10)
!16 = !DILocation(line: 3, column: 54, scope: !7)
!17 = !DILocalVariable(name: "bias", scope: !7, file: !1, line: 4, type: !10)
!18 = !DILocation(line: 4, column: 9, scope: !7)
!19 = !DILocation(line: 5, column: 9, scope: !20)
!20 = distinct !DILexicalBlock(scope: !7, file: !1, line: 5, column: 9)
!21 = !DILocation(line: 5, column: 9, scope: !7)
!22 = !DILocation(line: 6, column: 14, scope: !20)
!23 = !DILocation(line: 6, column: 13, scope: !20)
!24 = !DILocation(line: 6, column: 9, scope: !20)
!25 = !DILocation(line: 8, column: 14, scope: !20)
!26 = !DILocation(line: 8, column: 13, scope: !20)
!27 = !DILocation(line: 9, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !7, file: !1, line: 9, column: 9)
!29 = !DILocation(line: 9, column: 14, scope: !28)
!30 = !DILocation(line: 9, column: 13, scope: !28)
!31 = !DILocation(line: 9, column: 9, scope: !7)
!32 = !DILocation(line: 10, column: 9, scope: !28)
!33 = !DILocation(line: 12, column: 2, scope: !28)
!34 = !DILocation(line: 13, column: 1, scope: !7)
!35 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 14, type: !36, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!36 = !DISubroutineType(types: !37)
!37 = !{!10, !10, !38}
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!40 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!41 = !DILocalVariable(name: "argc", arg: 1, scope: !35, file: !1, line: 14, type: !10)
!42 = !DILocation(line: 14, column: 14, scope: !35)
!43 = !DILocalVariable(name: "argv", arg: 2, scope: !35, file: !1, line: 14, type: !38)
!44 = !DILocation(line: 14, column: 25, scope: !35)
!45 = !DILocalVariable(name: "a", scope: !35, file: !1, line: 15, type: !10)
!46 = !DILocation(line: 15, column: 9, scope: !35)
!47 = !DILocation(line: 15, column: 16, scope: !35)
!48 = !DILocation(line: 15, column: 11, scope: !35)
!49 = !DILocalVariable(name: "b", scope: !35, file: !1, line: 16, type: !10)
!50 = !DILocation(line: 16, column: 9, scope: !35)
!51 = !DILocation(line: 16, column: 16, scope: !35)
!52 = !DILocation(line: 16, column: 11, scope: !35)
!53 = !DILocalVariable(name: "c", scope: !35, file: !1, line: 17, type: !10)
!54 = !DILocation(line: 17, column: 9, scope: !35)
!55 = !DILocation(line: 17, column: 16, scope: !35)
!56 = !DILocation(line: 17, column: 11, scope: !35)
!57 = !DILocation(line: 18, column: 39, scope: !35)
!58 = !DILocation(line: 18, column: 41, scope: !35)
!59 = !DILocation(line: 18, column: 43, scope: !35)
!60 = !DILocation(line: 18, column: 19, scope: !35)
!61 = !DILocation(line: 18, column: 5, scope: !35)
!62 = !DILocation(line: 19, column: 5, scope: !35)
