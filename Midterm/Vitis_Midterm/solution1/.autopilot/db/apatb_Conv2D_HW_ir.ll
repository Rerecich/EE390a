; ModuleID = '/home/rerecich/EE-390a/CNN/Midterm/Midterm/Vitis_Midterm/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_uint<1>" = type { %"struct.ap_int_base<1, false>" }
%"struct.ap_int_base<1, false>" = type { %"struct.ssdm_int<1, false>" }
%"struct.ssdm_int<1, false>" = type { i1 }

; Function Attrs: noinline
define void @apatb_Conv2D_HW_ir(i32* noalias nocapture nonnull readonly %input, i32* noalias nocapture nonnull %output, i32* noalias nocapture nonnull readonly %coeffs, i32* noalias nocapture nonnull readonly %biases, i32 %numChannels, i32 %numFilters, i32 %inputWidth, i32 %inputHeight, i32 %convWidth, i32 %convHeight, %"struct.ap_uint<1>"* nocapture readonly %apply_relu) local_unnamed_addr #0 {
entry:
  %malloccall = tail call i8* @malloc(i64 800000)
  %input_copy = bitcast i8* %malloccall to [200000 x i32]*
  %malloccall1 = tail call i8* @malloc(i64 800000)
  %output_copy = bitcast i8* %malloccall1 to [200000 x i32]*
  %malloccall2 = tail call i8* @malloc(i64 800000)
  %coeffs_copy = bitcast i8* %malloccall2 to [200000 x i32]*
  %malloccall3 = tail call i8* @malloc(i64 800000)
  %biases_copy = bitcast i8* %malloccall3 to [200000 x i32]*
  %0 = bitcast i32* %input to [200000 x i32]*
  %1 = bitcast i32* %output to [200000 x i32]*
  %2 = bitcast i32* %coeffs to [200000 x i32]*
  %3 = bitcast i32* %biases to [200000 x i32]*
  call fastcc void @copy_in([200000 x i32]* nonnull %0, [200000 x i32]* %input_copy, [200000 x i32]* nonnull %1, [200000 x i32]* %output_copy, [200000 x i32]* nonnull %2, [200000 x i32]* %coeffs_copy, [200000 x i32]* nonnull %3, [200000 x i32]* %biases_copy)
  %4 = getelementptr inbounds [200000 x i32], [200000 x i32]* %input_copy, i32 0, i32 0
  %5 = getelementptr inbounds [200000 x i32], [200000 x i32]* %output_copy, i32 0, i32 0
  %6 = getelementptr inbounds [200000 x i32], [200000 x i32]* %coeffs_copy, i32 0, i32 0
  %7 = getelementptr inbounds [200000 x i32], [200000 x i32]* %biases_copy, i32 0, i32 0
  call void @apatb_Conv2D_HW_hw(i32* %4, i32* %5, i32* %6, i32* %7, i32 %numChannels, i32 %numFilters, i32 %inputWidth, i32 %inputHeight, i32 %convWidth, i32 %convHeight, %"struct.ap_uint<1>"* %apply_relu)
  call void @copy_back([200000 x i32]* %0, [200000 x i32]* %input_copy, [200000 x i32]* %1, [200000 x i32]* %output_copy, [200000 x i32]* %2, [200000 x i32]* %coeffs_copy, [200000 x i32]* %3, [200000 x i32]* %biases_copy)
  tail call void @free(i8* %malloccall)
  tail call void @free(i8* %malloccall1)
  tail call void @free(i8* %malloccall2)
  tail call void @free(i8* %malloccall3)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_in([200000 x i32]* noalias readonly, [200000 x i32]* noalias, [200000 x i32]* noalias readonly, [200000 x i32]* noalias, [200000 x i32]* noalias readonly, [200000 x i32]* noalias, [200000 x i32]* noalias readonly, [200000 x i32]* noalias) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a200000i32([200000 x i32]* %1, [200000 x i32]* %0)
  call fastcc void @onebyonecpy_hls.p0a200000i32([200000 x i32]* %3, [200000 x i32]* %2)
  call fastcc void @onebyonecpy_hls.p0a200000i32([200000 x i32]* %5, [200000 x i32]* %4)
  call fastcc void @onebyonecpy_hls.p0a200000i32([200000 x i32]* %7, [200000 x i32]* %6)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a200000i32([200000 x i32]* noalias, [200000 x i32]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [200000 x i32]* %0, null
  %3 = icmp eq [200000 x i32]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [200000 x i32], [200000 x i32]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [200000 x i32], [200000 x i32]* %1, i64 0, i64 %for.loop.idx1
  %5 = load i32, i32* %src.addr, align 4
  store i32 %5, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 200000
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_out([200000 x i32]* noalias, [200000 x i32]* noalias readonly, [200000 x i32]* noalias, [200000 x i32]* noalias readonly, [200000 x i32]* noalias, [200000 x i32]* noalias readonly, [200000 x i32]* noalias, [200000 x i32]* noalias readonly) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0a200000i32([200000 x i32]* %0, [200000 x i32]* %1)
  call fastcc void @onebyonecpy_hls.p0a200000i32([200000 x i32]* %2, [200000 x i32]* %3)
  call fastcc void @onebyonecpy_hls.p0a200000i32([200000 x i32]* %4, [200000 x i32]* %5)
  call fastcc void @onebyonecpy_hls.p0a200000i32([200000 x i32]* %6, [200000 x i32]* %7)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_Conv2D_HW_hw(i32*, i32*, i32*, i32*, i32, i32, i32, i32, i32, i32, %"struct.ap_uint<1>"*)

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_back([200000 x i32]* noalias, [200000 x i32]* noalias readonly, [200000 x i32]* noalias, [200000 x i32]* noalias readonly, [200000 x i32]* noalias, [200000 x i32]* noalias readonly, [200000 x i32]* noalias, [200000 x i32]* noalias readonly) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0a200000i32([200000 x i32]* %2, [200000 x i32]* %3)
  ret void
}

define void @Conv2D_HW_hw_stub_wrapper(i32*, i32*, i32*, i32*, i32, i32, i32, i32, i32, i32, %"struct.ap_uint<1>"*) #4 {
entry:
  %11 = bitcast i32* %0 to [200000 x i32]*
  %12 = bitcast i32* %1 to [200000 x i32]*
  %13 = bitcast i32* %2 to [200000 x i32]*
  %14 = bitcast i32* %3 to [200000 x i32]*
  call void @copy_out([200000 x i32]* null, [200000 x i32]* %11, [200000 x i32]* null, [200000 x i32]* %12, [200000 x i32]* null, [200000 x i32]* %13, [200000 x i32]* null, [200000 x i32]* %14)
  %15 = bitcast [200000 x i32]* %11 to i32*
  %16 = bitcast [200000 x i32]* %12 to i32*
  %17 = bitcast [200000 x i32]* %13 to i32*
  %18 = bitcast [200000 x i32]* %14 to i32*
  call void @Conv2D_HW_hw_stub(i32* %15, i32* %16, i32* %17, i32* %18, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, %"struct.ap_uint<1>"* %10)
  call void @copy_in([200000 x i32]* null, [200000 x i32]* %11, [200000 x i32]* null, [200000 x i32]* %12, [200000 x i32]* null, [200000 x i32]* %13, [200000 x i32]* null, [200000 x i32]* %14)
  ret void
}

declare void @Conv2D_HW_hw_stub(i32*, i32*, i32*, i32*, i32, i32, i32, i32, i32, i32, %"struct.ap_uint<1>"*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyout" }
attributes #4 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
