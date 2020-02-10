; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -aggressive-instcombine -S | FileCheck %s
; RUN: opt < %s -passes=aggressive-instcombine -S | FileCheck %s

target datalayout = "e-m:m-p1:64:64:64-p:32:32:32-n8:16:32"

define dso_local i16 @select_i16(i16 %a, i16 %b, i1 %cond) {
; CHECK-LABEL: @select_i16(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CONV0:%.*]] = sext i16 [[A:%.*]] to i32
; CHECK-NEXT:    [[CONV1:%.*]] = sext i16 [[B:%.*]] to i32
; CHECK-NEXT:    [[SEL:%.*]] = select i1 [[COND:%.*]], i32 [[CONV0]], i32 [[CONV1]]
; CHECK-NEXT:    [[CONV4:%.*]] = trunc i32 [[SEL]] to i16
; CHECK-NEXT:    ret i16 [[CONV4]]
;
entry:
  %conv0 = sext i16 %a to i32
  %conv1 = sext i16 %b to i32
  %sel = select i1 %cond, i32 %conv0, i32 %conv1
  %conv4 = trunc i32 %sel to i16
  ret i16 %conv4
}

define dso_local i8 @select_i8(i8 %a, i8 %b, i1 %cond) {
; CHECK-LABEL: @select_i8(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CONV0:%.*]] = sext i8 [[A:%.*]] to i32
; CHECK-NEXT:    [[CONV1:%.*]] = sext i8 [[B:%.*]] to i32
; CHECK-NEXT:    [[SEL:%.*]] = select i1 [[COND:%.*]], i32 [[CONV0]], i32 [[CONV1]]
; CHECK-NEXT:    [[CONV4:%.*]] = trunc i32 [[SEL]] to i8
; CHECK-NEXT:    ret i8 [[CONV4]]
;
entry:
  %conv0 = sext i8 %a to i32
  %conv1 = sext i8 %b to i32
  %sel = select i1 %cond, i32 %conv0, i32 %conv1
  %conv4 = trunc i32 %sel to i8
  ret i8 %conv4
}

define dso_local i16 @select_i8Ops_trunc_i16(i8 %a, i8 %b, i1 %cond) {
; CHECK-LABEL: @select_i8Ops_trunc_i16(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CONV0:%.*]] = sext i8 [[A:%.*]] to i32
; CHECK-NEXT:    [[CONV1:%.*]] = sext i8 [[B:%.*]] to i32
; CHECK-NEXT:    [[SEL:%.*]] = select i1 [[COND:%.*]], i32 [[CONV0]], i32 [[CONV1]]
; CHECK-NEXT:    [[CONV4:%.*]] = trunc i32 [[SEL]] to i16
; CHECK-NEXT:    ret i16 [[CONV4]]
;
entry:
  %conv0 = sext i8 %a to i32
  %conv1 = sext i8 %b to i32
  %sel = select i1 %cond, i32 %conv0, i32 %conv1
  %conv4 = trunc i32 %sel to i16
  ret i16 %conv4
}

;
define dso_local i16 @select_i16_const(i16 %a, i1 %cond) {
; CHECK-LABEL: @select_i16_const(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CONV:%.*]] = sext i16 [[A:%.*]] to i32
; CHECK-NEXT:    [[SEL:%.*]] = select i1 [[COND:%.*]], i32 109, i32 [[CONV]]
; CHECK-NEXT:    [[CONV4:%.*]] = trunc i32 [[SEL]] to i16
; CHECK-NEXT:    ret i16 [[CONV4]]
;
entry:
  %conv = sext i16 %a to i32
  %sel = select i1 %cond, i32 109, i32 %conv
  %conv4 = trunc i32 %sel to i16
  ret i16 %conv4
}

; 3080196 = 0x2f0004
define dso_local i16 @select_i16_bigConst(i16 %a, i1 %cond) {
; CHECK-LABEL: @select_i16_bigConst(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CONV:%.*]] = sext i16 [[A:%.*]] to i32
; CHECK-NEXT:    [[SEL:%.*]] = select i1 [[COND:%.*]], i32 3080196, i32 [[CONV]]
; CHECK-NEXT:    [[CONV4:%.*]] = trunc i32 [[SEL]] to i16
; CHECK-NEXT:    ret i16 [[CONV4]]
;
entry:
  %conv = sext i16 %a to i32
  %sel = select i1 %cond, i32 3080196, i32 %conv
  %conv4 = trunc i32 %sel to i16
  ret i16 %conv4
}

define dso_local i8 @select_i8_const(i8 %a, i1 %cond) {
; CHECK-LABEL: @select_i8_const(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CONV:%.*]] = sext i8 [[A:%.*]] to i32
; CHECK-NEXT:    [[SEL:%.*]] = select i1 [[COND:%.*]], i32 109, i32 [[CONV]]
; CHECK-NEXT:    [[CONV4:%.*]] = trunc i32 [[SEL]] to i8
; CHECK-NEXT:    ret i8 [[CONV4]]
;
entry:
  %conv = sext i8 %a to i32
  %sel = select i1 %cond, i32 109, i32 %conv
  %conv4 = trunc i32 %sel to i8
  ret i8 %conv4
}

; 20228 = 0x4f02
define dso_local i8 @select_i8_bigConst(i8 %a, i1 %cond) {
; CHECK-LABEL: @select_i8_bigConst(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CONV:%.*]] = sext i8 [[A:%.*]] to i32
; CHECK-NEXT:    [[SEL:%.*]] = select i1 [[COND:%.*]], i32 20228, i32 [[CONV]]
; CHECK-NEXT:    [[CONV4:%.*]] = trunc i32 [[SEL]] to i8
; CHECK-NEXT:    ret i8 [[CONV4]]
;
entry:
  %conv = sext i8 %a to i32
  %sel = select i1 %cond, i32 20228, i32 %conv
  %conv4 = trunc i32 %sel to i8
  ret i8 %conv4
}

define dso_local i16 @select_sext(i8 %a, i1 %cond) {
; CHECK-LABEL: @select_sext(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CONV:%.*]] = sext i8 [[A:%.*]] to i32
; CHECK-NEXT:    [[SUB:%.*]] = sub nsw i32 0, [[CONV]]
; CHECK-NEXT:    [[SEL:%.*]] = select i1 [[COND:%.*]], i32 [[SUB]], i32 [[CONV]]
; CHECK-NEXT:    [[CONV4:%.*]] = trunc i32 [[SEL]] to i16
; CHECK-NEXT:    ret i16 [[CONV4]]
;
entry:
  %conv = sext i8 %a to i32
  %sub = sub nsw i32 0, %conv
  %sel = select i1 %cond, i32 %sub, i32 %conv
  %conv4 = trunc i32 %sel to i16
  ret i16 %conv4
}

define dso_local i16 @select_zext(i8 %a, i1 %cond) {
; CHECK-LABEL: @select_zext(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CONV:%.*]] = zext i8 [[A:%.*]] to i32
; CHECK-NEXT:    [[SUB:%.*]] = sub nsw i32 0, [[CONV]]
; CHECK-NEXT:    [[SEL:%.*]] = select i1 [[COND:%.*]], i32 [[SUB]], i32 [[CONV]]
; CHECK-NEXT:    [[CONV4:%.*]] = trunc i32 [[SEL]] to i16
; CHECK-NEXT:    ret i16 [[CONV4]]
;
entry:
  %conv = zext i8 %a to i32
  %sub = sub nsw i32 0, %conv
  %sel = select i1 %cond, i32 %sub, i32 %conv
  %conv4 = trunc i32 %sel to i16
  ret i16 %conv4
}

