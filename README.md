# Objective-C KVO Crash with Weak References

This repository demonstrates a common, yet subtle, bug in Objective-C related to Key-Value Observing (KVO) and weak references.  When an observer uses a weak reference to observe another object, and the observed object is deallocated, attempting to access its properties can lead to a crash.

The `WeakKVOBug.m` file shows the problematic code, while `WeakKVOSolution.m` provides a solution to prevent the crash.  The issue is explained in detail in the comments within the code files.