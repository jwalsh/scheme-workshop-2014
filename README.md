# Overview 

Create a baseline of Scheme features particularly those targeted by R6RS
and R7RS as given by top implementation and contrasted with the core
language features provided by 

  https://pragprog.com/book/7lang/seven-more-languages-in-seven-weeks

in addition to several other languages. 

# Installation

Assuming interpreters are install the examples should be runnable from
directly inside the directory.  A Docker container deployable to any
standard VPS should be available with the major version of the core
interpreters. 

# Review 

## R1RS

http://progopedia.com/dialect/scheme/

## R5RS 

http://docs.racket-lang.org/r5rs/r5rs-std/index.html

## R6RS

http://docs.racket-lang.org/guide/standards.html#%28part._r5rs%29

```
1 Overview of Scheme . . . . . . . . . . . . . . . . . 5
1.1 Basic types . . . . . . . . . . . . . . . . . . 5
1.2 Expressions . . . . . . . . . . . . . . . . . . 6
1.3 Variables and binding . . . . . . . . . . . . 6
1.4 Definitions . . . . . . . . . . . . . . . . . . . 6
1.5 Forms . . . . . . . . . . . . . . . . . . . . . 7
1.6 Procedures . . . . . . . . . . . . . . . . . . 7
1.7 Procedure calls and syntactic keywords . . . 7
1.8 Assignment . . . . . . . . . . . . . . . . . . 7
1.9 Derived forms and macros . . . . . . . . . . 8
1.10 Syntactic data and datum values . . . . . . 8
1.11 Continuations . . . . . . . . . . . . . . . . . 8
1.12 Libraries . . . . . . . . . . . . . . . . . . . . 9
1.13 Top-level programs . . . . . . . . . . . . . . 9
2 Requirement levels . . . . . . . . . . . . . . . . . 9
3 Numbers . . . . . . . . . . . . . . . . . . . . . . . 10
3.1 Numerical tower . . . . . . . . . . . . . . . 10
3.2 Exactness . . . . . . . . . . . . . . . . . . . 10
3.3 Fixnums and flonums . . . . . . . . . . . . . 10
3.4 Implementation requirements . . . . . . . . 10
3.5 Infinities and NaNs . . . . . . . . . . . . . . 11
3.6 Distinguished -0.0 . . . . . . . . . . . . . . 11
4 Lexical syntax and datum syntax . . . . . . . . . 11
4.1 Notation . . . . . . . . . . . . . . . . . . . . 12
4.2 Lexical syntax . . . . . . . . . . . . . . . . . 12
4.3 Datum syntax . . . . . . . . . . . . . . . . . 16
5 Semantic concepts . . . . . . . . . . . . . . . . . . 17
5.1 Programs and libraries . . . . . . . . . . . . 17
5.2 Variables, keywords, and regions . . . . . . 17
5.3 Exceptional situations . . . . . . . . . . . . 18
5.4 Argument checking . . . . . . . . . . . . . . 18
5.5 Syntax violations . . . . . . . . . . . . . . . 19
5.6 Safety . . . . . . . . . . . . . . . . . . . . . 19
5.7 Boolean values . . . . . . . . . . . . . . . . 19
5.8 Multiple return values . . . . . . . . . . . . 19
5.9 Unspecified behavior . . . . . . . . . . . . . 20
5.10 Storage model . . . . . . . . . . . . . . . . . 20
5.11 Proper tail recursion . . . . . . . . . . . . . 20
5.12 Dynamic extent and the dynamic environment 20
6 Entry format . . . . . . . . . . . . . . . . . . . . . 20
6.1 Syntax entries . . . . . . . . . . . . . . . . . 21
6.2 Procedure entries . . . . . . . . . . . . . . . 21
6.3 Implementation responsibilities . . . . . . . 22
6.4 Other kinds of entries . . . . . . . . . . . . 22
6.5 Equivalent entries . . . . . . . . . . . . . . . 22
6.6 Evaluation examples . . . . . . . . . . . . . 22
6.7 Naming conventions . . . . . . . . . . . . . 23
7 Libraries . . . . . . . . . . . . . . . . . . . . . . . 23
7.1 Library form . . . . . . . . . . . . . . . . . 23
7.2 Import and export levels . . . . . . . . . . . 25
7.3 Examples . . . . . . . . . . . . . . . . . . . 26
8 Top-level programs . . . . . . . . . . . . . . . . . 27
8.1 Top-level program syntax . . . . . . . . . . 27
8.2 Top-level program semantics . . . . . . . . . 28
9 Primitive syntax . . . . . . . . . . . . . . . . . . . 28
9.1 Primitive expression types . . . . . . . . . . 28
9.2 Macros . . . . . . . . . . . . . . . . . . . . . 29
10 Expansion process . . . . . . . . . . . . . . . . . . 29
11 Base library . . . . . . . . . . . . . . . . . . . . . 31
11.1 Base types . . . . . . . . . . . . . . . . . . . 31
11.2 Definitions . . . . . . . . . . . . . . . . . . . 31
11.3 Bodies . . . . . . . . . . . . . . . . . . . . . 32
11.4 Expressions . . . . . . . . . . . . . . . . . . 32
11.5 Equivalence predicates . . . . . . . . . . . . 37
11.6 Procedure predicate . . . . . . . . . . . . . 39
11.7 Arithmetic . . . . . . . . . . . . . . . . . . . 39
11.8 Booleans . . . . . . . . . . . . . . . . . . . . 47
11.9 Pairs and lists . . . . . . . . . . . . . . . . . 47
11.10Symbols . . . . . . . . . . . . . . . . . . . . 49
11.11Characters . . . . . . . . . . . . . . . . . . . 50
11.12Strings . . . . . . . . . . . . . . . . . . . . . 50
11.13Vectors . . . . . . . . . . . . . . . . . . . . 51
11.14Errors and violations . . . . . . . . . . . . . 52
11.15Control features . . . . . . . . . . . . . . . . 53
11.16Iteration . . . . . . . . . . . . . . . . . . . . 55
11.17Quasiquotation . . . . . . . . . . . . . . . . 55
11.18Binding constructs for syntactic keywords . 56
11.19Macro transformers . . . . . . . . . . . . . . 57
11.20Tail calls and tail contexts . . . . . . . . . . 59
```

## R7RS 

```
1 Overview of Scheme . . . . . . . . . . . . . . . . . . . . . . . 5
1.1 Semantics . . . . . . . . . . . . . . . . . . . . . . . . . 5
1.2 Syntax . . . . . . . . . . . . . . . . . . . . . . . . . . . 5
1.3 Notation and terminology . . . . . . . . . . . . . . . . 5
2 Lexical conventions . . . . . . . . . . . . . . . . . . . . . . . 7
2.1 Identifiers . . . . . . . . . . . . . . . . . . . . . . . . . 7
2.2 Whitespace and comments . . . . . . . . . . . . . . . . 8
2.3 Other notations . . . . . . . . . . . . . . . . . . . . . . 8
2.4 Datum labels . . . . . . . . . . . . . . . . . . . . . . . 9
3 Basic concepts . . . . . . . . . . . . . . . . . . . . . . . . . . 9
3.1 Variables, syntactic keywords, and regions . . . . . . . 9
3.2 Disjointness of types . . . . . . . . . . . . . . . . . . . 10
3.3 External representations . . . . . . . . . . . . . . . . . 10
3.4 Storage model . . . . . . . . . . . . . . . . . . . . . . . 10
3.5 Proper tail recursion . . . . . . . . . . . . . . . . . . . 11
4 Expressions . . . . . . . . . . . . . . . . . . . . . . . . . . . 12
4.1 Primitive expression types . . . . . . . . . . . . . . . . 12
4.2 Derived expression types . . . . . . . . . . . . . . . . . 14
4.3 Macros . . . . . . . . . . . . . . . . . . . . . . . . . . . 21
5 Program structure . . . . . . . . . . . . . . . . . . . . . . . . 25
5.1 Programs . . . . . . . . . . . . . . . . . . . . . . . . . 25
5.2 Import declarations . . . . . . . . . . . . . . . . . . . . 25
5.3 Variable definitions . . . . . . . . . . . . . . . . . . . . 25
5.4 Syntax definitions . . . . . . . . . . . . . . . . . . . . 26
5.5 Record-type definitions . . . . . . . . . . . . . . . . . . 27
5.6 Libraries . . . . . . . . . . . . . . . . . . . . . . . . . . 28
5.7 The REPL . . . . . . . . . . . . . . . . . . . . . . . . 29
6 Standard procedures . . . . . . . . . . . . . . . . . . . . . . 30
6.1 Equivalence predicates . . . . . . . . . . . . . . . . . . 30
6.2 Numbers . . . . . . . . . . . . . . . . . . . . . . . . . . 32
6.3 Booleans . . . . . . . . . . . . . . . . . . . . . . . . . . 40
6.4 Pairs and lists . . . . . . . . . . . . . . . . . . . . . . . 40
6.5 Symbols . . . . . . . . . . . . . . . . . . . . . . . . . . 43
6.6 Characters . . . . . . . . . . . . . . . . . . . . . . . . . 44
6.7 Strings . . . . . . . . . . . . . . . . . . . . . . . . . . . 45
6.8 Vectors . . . . . . . . . . . . . . . . . . . . . . . . . . 48
6.9 Bytevectors . . . . . . . . . . . . . . . . . . . . . . . . 49
6.10 Control features . . . . . . . . . . . . . . . . . . . . . . 50
6.11 Exceptions . . . . . . . . . . . . . . . . . . . . . . . . 54
6.12 Environments and evaluation . . . . . . . . . . . . . . 55
6.13 Input and output . . . . . . . . . . . . . . . . . . . . . 55
6.14 System interface . . . . . . . . . . . . . . . . . . . . . 59
7 Formal syntax and semantics . . . . . . . . . . . . . . . . . . 61
7.1 Formal syntax . . . . . . . . . . . . . . . . . . . . . . . 61
7.2 Formal semantics . . . . . . . . . . . . . . . . . . . . . 65
7.3 Derived expression types . . . . . . . . . . . . . . . . . 68
A Standard Libraries . . . . . . . . . . . . . . . . . . . . . . . 73
```
