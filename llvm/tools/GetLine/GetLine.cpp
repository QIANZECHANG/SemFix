//===- Hello.cpp - Example code from "Writing an LLVM Pass" ---------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file implements two versions of the LLVM "Hello World" pass described
// in docs/WritingAnLLVMPass.html
//
//===----------------------------------------------------------------------===//
#include "llvm/IR/Function.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/DebugLoc.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/IRBuilder.h"
using namespace llvm;

#define DEBUG_TYPE "getline"

namespace {
  // Hello - The first implementation, without getAnalysisUsage.
  struct GetLine : public FunctionPass {
    static char ID; // Pass identification, replacement for typeid
    GetLine():FunctionPass(ID){}
    bool runOnFunction(Function &F) override {
      errs() << "Hello: ";
      errs().write_escaped(F.getName()) << '\n';
        
      Module* M=F.getParent();
      LLVMContext & context=M->getContext();

      std::vector<Type *> printfArgsTypes({Type::getInt8PtrTy(context)});	
      FunctionType *printfType=FunctionType::get(Type::getInt32Ty(context),printfArgsTypes,true);
      auto printfFunc=M->getOrInsertFunction("printf",printfType);
      for (BasicBlock &BB:F){
        for (Instruction &I:BB){
          errs()<<"I:"<<I<<"\n";
          Instruction* pi=&I;
          const DebugLoc &location=pi->getDebugLoc();
          if(location){
            IRBuilder<> Builder(pi);
	
	    std::vector<llvm::Value*> args;
	    Value *str=Builder.CreateGlobalStringPtr("line: %d\n");
	    args.push_back(str);

	    auto linePtrVal=Builder.CreateAlloca(
                            Type::getInt32Ty(context),
                            ConstantInt::get(Type::getInt32Ty(context),1));
	    Builder.CreateStore(
                            ConstantInt::get(Type::getInt32Ty(context),location.getLine()),
			    linePtrVal
	                    );
            auto line=Builder.CreateLoad(linePtrVal);
            args.push_back(line);

	    Builder.CreateCall(printfFunc,args);
        	
	//errs()<<"line: "<<location.getLine()<<'\n';
	//errs()<<"line:"<<debugInfo->getLine()<<'\n';
	  }
        }
      }
      return true;
    }
  };
}

char GetLine::ID = 0;
static RegisterPass<GetLine> X("getline","GetLine Pass");

