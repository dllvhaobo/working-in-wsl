# Clang-Format Style Options

This section lists the supported style options. Value type is specified for each option. For enumeration types possible values are specified both as a C++ enumeration member (with a prefix, e.g. `LS_Auto`), and as a value usable in the configuration (without a prefix: `Auto`).

__BasedOnStyle__ (`String`)

The style used for all options not specifically set in the configuration.

This option is supported only in the __clang-format__ configuration (both within `-style='{...}'` and the `.clang-format` file).

Possible values:

-   `LLVM` A style complying with the [LLVM coding standards][1]
    
-   `Google` A style complying with [Google’s C++ style guide][2]
    
-   `Chromium` A style complying with [Chromium’s style guide][3]
    
-   `Mozilla` A style complying with [Mozilla’s style guide][4]
    
-   `WebKit` A style complying with [WebKit’s style guide][5]
    
-   `Microsoft` A style complying with [Microsoft’s style guide][6]
    
-   `GNU` A style complying with the [GNU coding standards][7]
    
-   `InheritParentConfig` Not a real style, but allows to use the `.clang-format` file from the parent directory (or its parent if there is none). If there is no parent file found it falls back to the `fallback` style, and applies the changes to that.
    
    With this option you can overwrite some parts of your main style for your subdirectories. This is also possible through the command line, e.g.: `--style={BasedOnStyle: InheritParentConfig, ColumnLimit: 20}`
    

__AccessModifierOffset__ (`Integer`) clang-format 3.3

The extra indent or outdent of access modifiers, e.g. `public:`.

__AlignAfterOpenBracket__ (`BracketAlignmentStyle`) clang-format 3.8

If `true`, horizontally aligns arguments after an open bracket.

This applies to round brackets (parentheses), angle brackets and square brackets.

Possible values:

-   `BAS_Align` (in configuration: `Align`) Align parameters on the open bracket, e.g.:
    
    ```
    someLongFunction(argument1,
                     argument2);
    
    ```
    
-   `BAS_DontAlign` (in configuration: `DontAlign`) Don’t align, instead use `ContinuationIndentWidth`, e.g.:
    
    ```
    someLongFunction(argument1,
        argument2);
    
    ```
    
-   `BAS_AlwaysBreak` (in configuration: `AlwaysBreak`) Always break after an open bracket, if the parameters don’t fit on a single line, e.g.:
    
    ```
    someLongFunction(
        argument1, argument2);
    
    ```
    
-   `BAS_BlockIndent` (in configuration: `BlockIndent`) Always break after an open bracket, if the parameters don’t fit on a single line. Closing brackets will be placed on a new line. E.g.:
    
    ```
    someLongFunction(
        argument1, argument2
    )
    
    ```
    
    Warning
    
    Note: This currently only applies to parentheses.
    

__AlignArrayOfStructures__ (`ArrayInitializerAlignmentStyle`) clang-format 13

if not `None`, when using initialization for an array of structs aligns the fields into columns.

NOTE: As of clang-format 15 this option only applied to arrays with equal number of columns per row.

Possible values:

-   `AIAS_Left` (in configuration: `Left`) Align array column and left justify the columns e.g.:
    
    ```
    struct test demo[] =
    {
        {56, 23,    "hello"},
        {-1, 93463, "world"},
        {7,  5,     "!!"   }
    };
    
    ```
    
-   `AIAS_Right` (in configuration: `Right`) Align array column and right justify the columns e.g.:
    
    ```
    struct test demo[] =
    {
        {56,    23, "hello"},
        {-1, 93463, "world"},
        { 7,     5,    "!!"}
    };
    
    ```
    
-   `AIAS_None` (in configuration: `None`) Don’t align array initializer columns.
    

__AlignConsecutiveAssignments__ (`AlignConsecutiveStyle`) clang-format 3.8

Style of aligning consecutive assignments.

`Consecutive` will result in formattings like:

```
int a            = 1;
int somelongname = 2;
double c         = 3;

```

Nested configuration flags:

Alignment options.

They can also be read as a whole for compatibility. The choices are: - None - Consecutive - AcrossEmptyLines - AcrossComments - AcrossEmptyLinesAndComments

For example, to align across empty lines and not across comments, either of these work.

```
AlignConsecutiveMacros: AcrossEmptyLines

AlignConsecutiveMacros:
  Enabled: true
  AcrossEmptyLines: true
  AcrossComments: false

```

-   `bool Enabled` Whether aligning is enabled.
    
    ```
    #define SHORT_NAME       42
    #define LONGER_NAME      0x007f
    #define EVEN_LONGER_NAME (2)
    #define foo(x)           (x * x)
    #define bar(y, z)        (y + z)
    
    int a            = 1;
    int somelongname = 2;
    double c         = 3;
    
    int aaaa : 1;
    int b    : 12;
    int ccc  : 8;
    
    int         aaaa = 12;
    float       b = 23;
    std::string ccc;
    
    ```
    
-   `bool AcrossEmptyLines` Whether to align across empty lines.
    
    ```
    true:
    int a            = 1;
    int somelongname = 2;
    double c         = 3;
    
    int d            = 3;
    
    false:
    int a            = 1;
    int somelongname = 2;
    double c         = 3;
    
    int d = 3;
    
    ```
    
-   `bool AcrossComments` Whether to align across comments.
    
    ```
    true:
    int d    = 3;
    /* A comment. */
    double e = 4;
    
    false:
    int d = 3;
    /* A comment. */
    double e = 4;
    
    ```
    
-   `bool AlignCompound` Only for `AlignConsecutiveAssignments`. Whether compound assignments like `+=` are aligned along with `=`.
    
    ```
    true:
    a   &= 2;
    bbb  = 2;
    
    false:
    a &= 2;
    bbb = 2;
    
    ```
    
-   `bool PadOperators` Only for `AlignConsecutiveAssignments`. Whether short assignment operators are left-padded to the same length as long ones in order to put all assignment operators to the right of the left hand side.
    
    ```
    true:
    a   >>= 2;
    bbb   = 2;
    
    a     = 2;
    bbb >>= 2;
    
    false:
    a >>= 2;
    bbb = 2;
    
    a     = 2;
    bbb >>= 2;
    
    ```
    

__AlignConsecutiveBitFields__ (`AlignConsecutiveStyle`) clang-format 11

Style of aligning consecutive bit fields.

`Consecutive` will align the bitfield separators of consecutive lines. This will result in formattings like:

```
int aaaa : 1;
int b    : 12;
int ccc  : 8;

```

Nested configuration flags:

Alignment options.

They can also be read as a whole for compatibility. The choices are: - None - Consecutive - AcrossEmptyLines - AcrossComments - AcrossEmptyLinesAndComments

For example, to align across empty lines and not across comments, either of these work.

```
AlignConsecutiveMacros: AcrossEmptyLines

AlignConsecutiveMacros:
  Enabled: true
  AcrossEmptyLines: true
  AcrossComments: false

```

-   `bool Enabled` Whether aligning is enabled.
    
    ```
    #define SHORT_NAME       42
    #define LONGER_NAME      0x007f
    #define EVEN_LONGER_NAME (2)
    #define foo(x)           (x * x)
    #define bar(y, z)        (y + z)
    
    int a            = 1;
    int somelongname = 2;
    double c         = 3;
    
    int aaaa : 1;
    int b    : 12;
    int ccc  : 8;
    
    int         aaaa = 12;
    float       b = 23;
    std::string ccc;
    
    ```
    
-   `bool AcrossEmptyLines` Whether to align across empty lines.
    
    ```
    true:
    int a            = 1;
    int somelongname = 2;
    double c         = 3;
    
    int d            = 3;
    
    false:
    int a            = 1;
    int somelongname = 2;
    double c         = 3;
    
    int d = 3;
    
    ```
    
-   `bool AcrossComments` Whether to align across comments.
    
    ```
    true:
    int d    = 3;
    /* A comment. */
    double e = 4;
    
    false:
    int d = 3;
    /* A comment. */
    double e = 4;
    
    ```
    
-   `bool AlignCompound` Only for `AlignConsecutiveAssignments`. Whether compound assignments like `+=` are aligned along with `=`.
    
    ```
    true:
    a   &= 2;
    bbb  = 2;
    
    false:
    a &= 2;
    bbb = 2;
    
    ```
    
-   `bool PadOperators` Only for `AlignConsecutiveAssignments`. Whether short assignment operators are left-padded to the same length as long ones in order to put all assignment operators to the right of the left hand side.
    
    ```
    true:
    a   >>= 2;
    bbb   = 2;
    
    a     = 2;
    bbb >>= 2;
    
    false:
    a >>= 2;
    bbb = 2;
    
    a     = 2;
    bbb >>= 2;
    
    ```
    

__AlignConsecutiveDeclarations__ (`AlignConsecutiveStyle`) clang-format 3.8

Style of aligning consecutive declarations.

`Consecutive` will align the declaration names of consecutive lines. This will result in formattings like:

```
int         aaaa = 12;
float       b = 23;
std::string ccc;

```

Nested configuration flags:

Alignment options.

They can also be read as a whole for compatibility. The choices are: - None - Consecutive - AcrossEmptyLines - AcrossComments - AcrossEmptyLinesAndComments

For example, to align across empty lines and not across comments, either of these work.

```
AlignConsecutiveMacros: AcrossEmptyLines

AlignConsecutiveMacros:
  Enabled: true
  AcrossEmptyLines: true
  AcrossComments: false

```

-   `bool Enabled` Whether aligning is enabled.
    
    ```
    #define SHORT_NAME       42
    #define LONGER_NAME      0x007f
    #define EVEN_LONGER_NAME (2)
    #define foo(x)           (x * x)
    #define bar(y, z)        (y + z)
    
    int a            = 1;
    int somelongname = 2;
    double c         = 3;
    
    int aaaa : 1;
    int b    : 12;
    int ccc  : 8;
    
    int         aaaa = 12;
    float       b = 23;
    std::string ccc;
    
    ```
    
-   `bool AcrossEmptyLines` Whether to align across empty lines.
    
    ```
    true:
    int a            = 1;
    int somelongname = 2;
    double c         = 3;
    
    int d            = 3;
    
    false:
    int a            = 1;
    int somelongname = 2;
    double c         = 3;
    
    int d = 3;
    
    ```
    
-   `bool AcrossComments` Whether to align across comments.
    
    ```
    true:
    int d    = 3;
    /* A comment. */
    double e = 4;
    
    false:
    int d = 3;
    /* A comment. */
    double e = 4;
    
    ```
    
-   `bool AlignCompound` Only for `AlignConsecutiveAssignments`. Whether compound assignments like `+=` are aligned along with `=`.
    
    ```
    true:
    a   &= 2;
    bbb  = 2;
    
    false:
    a &= 2;
    bbb = 2;
    
    ```
    
-   `bool PadOperators` Only for `AlignConsecutiveAssignments`. Whether short assignment operators are left-padded to the same length as long ones in order to put all assignment operators to the right of the left hand side.
    
    ```
    true:
    a   >>= 2;
    bbb   = 2;
    
    a     = 2;
    bbb >>= 2;
    
    false:
    a >>= 2;
    bbb = 2;
    
    a     = 2;
    bbb >>= 2;
    
    ```
    

__AlignConsecutiveMacros__ (`AlignConsecutiveStyle`) clang-format 9

Style of aligning consecutive macro definitions.

`Consecutive` will result in formattings like:

```
#define SHORT_NAME       42
#define LONGER_NAME      0x007f
#define EVEN_LONGER_NAME (2)
#define foo(x)           (x * x)
#define bar(y, z)        (y + z)

```

Nested configuration flags:

Alignment options.

They can also be read as a whole for compatibility. The choices are: - None - Consecutive - AcrossEmptyLines - AcrossComments - AcrossEmptyLinesAndComments

For example, to align across empty lines and not across comments, either of these work.

```
AlignConsecutiveMacros: AcrossEmptyLines

AlignConsecutiveMacros:
  Enabled: true
  AcrossEmptyLines: true
  AcrossComments: false

```

-   `bool Enabled` Whether aligning is enabled.
    
    ```
    #define SHORT_NAME       42
    #define LONGER_NAME      0x007f
    #define EVEN_LONGER_NAME (2)
    #define foo(x)           (x * x)
    #define bar(y, z)        (y + z)
    
    int a            = 1;
    int somelongname = 2;
    double c         = 3;
    
    int aaaa : 1;
    int b    : 12;
    int ccc  : 8;
    
    int         aaaa = 12;
    float       b = 23;
    std::string ccc;
    
    ```
    
-   `bool AcrossEmptyLines` Whether to align across empty lines.
    
    ```
    true:
    int a            = 1;
    int somelongname = 2;
    double c         = 3;
    
    int d            = 3;
    
    false:
    int a            = 1;
    int somelongname = 2;
    double c         = 3;
    
    int d = 3;
    
    ```
    
-   `bool AcrossComments` Whether to align across comments.
    
    ```
    true:
    int d    = 3;
    /* A comment. */
    double e = 4;
    
    false:
    int d = 3;
    /* A comment. */
    double e = 4;
    
    ```
    
-   `bool AlignCompound` Only for `AlignConsecutiveAssignments`. Whether compound assignments like `+=` are aligned along with `=`.
    
    ```
    true:
    a   &= 2;
    bbb  = 2;
    
    false:
    a &= 2;
    bbb = 2;
    
    ```
    
-   `bool PadOperators` Only for `AlignConsecutiveAssignments`. Whether short assignment operators are left-padded to the same length as long ones in order to put all assignment operators to the right of the left hand side.
    
    ```
    true:
    a   >>= 2;
    bbb   = 2;
    
    a     = 2;
    bbb >>= 2;
    
    false:
    a >>= 2;
    bbb = 2;
    
    a     = 2;
    bbb >>= 2;
    
    ```
    

__AlignEscapedNewlines__ (`EscapedNewlineAlignmentStyle`) clang-format 5

Options for aligning backslashes in escaped newlines.

Possible values:

-   `ENAS_DontAlign` (in configuration: `DontAlign`) Don’t align escaped newlines.
    
    ```
    #define A \
      int aaaa; \
      int b; \
      int dddddddddd;
    
    ```
    
-   `ENAS_Left` (in configuration: `Left`) Align escaped newlines as far left as possible.
    
    ```
    true:
    #define A   \
      int aaaa; \
      int b;    \
      int dddddddddd;
    
    false:
    
    ```
    
-   `ENAS_Right` (in configuration: `Right`) Align escaped newlines in the right-most column.
    
    ```
    #define A                                                                      \
      int aaaa;                                                                    \
      int b;                                                                       \
      int dddddddddd;
    
    ```
    

__AlignOperands__ (`OperandAlignmentStyle`) clang-format 3.5

If `true`, horizontally align operands of binary and ternary expressions.

Possible values:

-   `OAS_DontAlign` (in configuration: `DontAlign`) Do not align operands of binary and ternary expressions. The wrapped lines are indented `ContinuationIndentWidth` spaces from the start of the line.
    
-   `OAS_Align` (in configuration: `Align`) Horizontally align operands of binary and ternary expressions.
    
    Specifically, this aligns operands of a single expression that needs to be split over multiple lines, e.g.:
    
    ```
    int aaa = bbbbbbbbbbbbbbb +
              ccccccccccccccc;
    
    ```
    
    When `BreakBeforeBinaryOperators` is set, the wrapped operator is aligned with the operand on the first line.
    
    ```
    int aaa = bbbbbbbbbbbbbbb
              + ccccccccccccccc;
    
    ```
    
-   `OAS_AlignAfterOperator` (in configuration: `AlignAfterOperator`) Horizontally align operands of binary and ternary expressions.
    
    This is similar to `AO_Align`, except when `BreakBeforeBinaryOperators` is set, the operator is un-indented so that the wrapped operand is aligned with the operand on the first line.
    
    ```
    int aaa = bbbbbbbbbbbbbbb
            + ccccccccccccccc;
    
    ```
    

__AlignTrailingComments__ (`TrailingCommentsAlignmentStyle`) clang-format 3.7

Control of trailing comments.

NOTE: As of clang-format 16 this option is not a bool but can be set to the options. Conventional bool options still can be parsed as before.

```
# Example of usage:
AlignTrailingComments:
  Kind: Always
  OverEmptyLines: 2

```

Nested configuration flags:

Alignment options

-   `TrailingCommentsAlignmentKinds Kind` Specifies the way to align trailing comments.
    
    Possible values:
    
    -   `TCAS_Leave` (in configuration: `Leave`) Leave trailing comments as they are.
        
        ```
        int a;    // comment
        int ab;       // comment
        
        int abc;  // comment
        int abcd;     // comment
        
        ```
        
    -   `TCAS_Always` (in configuration: `Always`) Align trailing comments.
        
        ```
        int a;  // comment
        int ab; // comment
        
        int abc;  // comment
        int abcd; // comment
        
        ```
        
    -   `TCAS_Never` (in configuration: `Never`) Don’t align trailing comments but other formatter applies.
        
        ```
        int a; // comment
        int ab; // comment
        
        int abc; // comment
        int abcd; // comment
        
        ```
        
-   `unsigned OverEmptyLines` How many empty lines to apply alignment. When both `MaxEmptyLinesToKeep` and `OverEmptyLines` are set to 2, it formats like below.
    
    ```
    int a;      // all these
    
    int ab;     // comments are
    
    
    int abcdef; // aligned
    
    ```
    
    When `MaxEmptyLinesToKeep` is set to 2 and `OverEmptyLines` is set to 1, it formats like below.
    
    ```
    int a;  // these are
    
    int ab; // aligned
    
    
    int abcdef; // but this isn't
    
    ```
    

__AllowAllArgumentsOnNextLine__ (`Boolean`) clang-format 9

If a function call or braced initializer list doesn’t fit on a line, allow putting all arguments onto the next line, even if `BinPackArguments` is `false`.

```
true:
callFunction(
    a, b, c, d);

false:
callFunction(a,
             b,
             c,
             d);

```

__AllowAllConstructorInitializersOnNextLine__ (`Boolean`) clang-format 9

This option is __deprecated__. See `NextLine` of `PackConstructorInitializers`.

__AllowAllParametersOfDeclarationOnNextLine__ (`Boolean`) clang-format 3.3

If the function declaration doesn’t fit on a line, allow putting all parameters of a function declaration onto the next line even if `BinPackParameters` is `false`.

```
true:
void myFunction(
    int a, int b, int c, int d, int e);

false:
void myFunction(int a,
                int b,
                int c,
                int d,
                int e);

```

__AllowShortBlocksOnASingleLine__ (`ShortBlockStyle`) clang-format 3.5

Dependent on the value, `while (true) { continue; }` can be put on a single line.

Possible values:

-   `SBS_Never` (in configuration: `Never`) Never merge blocks into a single line.
    
    ```
    while (true) {
    }
    while (true) {
      continue;
    }
    
    ```
    
-   `SBS_Empty` (in configuration: `Empty`) Only merge empty blocks.
    
    ```
    while (true) {}
    while (true) {
      continue;
    }
    
    ```
    
-   `SBS_Always` (in configuration: `Always`) Always merge short blocks into a single line.
    
    ```
    while (true) {}
    while (true) { continue; }
    
    ```
    

__AllowShortCaseLabelsOnASingleLine__ (`Boolean`) clang-format 3.6

If `true`, short case labels will be contracted to a single line.

```
true:                                   false:
switch (a) {                    vs.     switch (a) {
case 1: x = 1; break;                   case 1:
case 2: return;                           x = 1;
}                                         break;
                                        case 2:
                                          return;
                                        }

```

__AllowShortEnumsOnASingleLine__ (`Boolean`) clang-format 11

Allow short enums on a single line.

```
true:
enum { A, B } myEnum;

false:
enum {
  A,
  B
} myEnum;

```

__AllowShortFunctionsOnASingleLine__ (`ShortFunctionStyle`) clang-format 3.5

Dependent on the value, `int f() { return 0; }` can be put on a single line.

Possible values:

-   `SFS_None` (in configuration: `None`) Never merge functions into a single line.
    
-   `SFS_InlineOnly` (in configuration: `InlineOnly`) Only merge functions defined inside a class. Same as “inline”, except it does not implies “empty”: i.e. top level empty functions are not merged either.
    
    ```
    class Foo {
      void f() { foo(); }
    };
    void f() {
      foo();
    }
    void f() {
    }
    
    ```
    
-   `SFS_Empty` (in configuration: `Empty`) Only merge empty functions.
    
    ```
    void f() {}
    void f2() {
      bar2();
    }
    
    ```
    
-   `SFS_Inline` (in configuration: `Inline`) Only merge functions defined inside a class. Implies “empty”.
    
    ```
    class Foo {
      void f() { foo(); }
    };
    void f() {
      foo();
    }
    void f() {}
    
    ```
    
-   `SFS_All` (in configuration: `All`) Merge all functions fitting on a single line.
    
    ```
    class Foo {
      void f() { foo(); }
    };
    void f() { bar(); }
    
    ```
    

__AllowShortIfStatementsOnASingleLine__ (`ShortIfStyle`) clang-format 3.3

Dependent on the value, `if (a) return;` can be put on a single line.

Possible values:

-   `SIS_Never` (in configuration: `Never`) Never put short ifs on the same line.
    
    ```
    if (a)
      return;
    
    if (b)
      return;
    else
      return;
    
    if (c)
      return;
    else {
      return;
    }
    
    ```
    
-   `SIS_WithoutElse` (in configuration: `WithoutElse`) Put short ifs on the same line only if there is no else statement.
    
    ```
    if (a) return;
    
    if (b)
      return;
    else
      return;
    
    if (c)
      return;
    else {
      return;
    }
    
    ```
    
-   `SIS_OnlyFirstIf` (in configuration: `OnlyFirstIf`) Put short ifs, but not else ifs nor else statements, on the same line.
    
    ```
    if (a) return;
    
    if (b) return;
    else if (b)
      return;
    else
      return;
    
    if (c) return;
    else {
      return;
    }
    
    ```
    
-   `SIS_AllIfsAndElse` (in configuration: `AllIfsAndElse`) Always put short ifs, else ifs and else statements on the same line.
    
    ```
    if (a) return;
    
    if (b) return;
    else return;
    
    if (c) return;
    else {
      return;
    }
    
    ```
    

__AllowShortLambdasOnASingleLine__ (`ShortLambdaStyle`) clang-format 9

Dependent on the value, `auto lambda []() { return 0; }` can be put on a single line.

Possible values:

-   `SLS_None` (in configuration: `None`) Never merge lambdas into a single line.
    
-   `SLS_Empty` (in configuration: `Empty`) Only merge empty lambdas.
    
    ```
    auto lambda = [](int a) {};
    auto lambda2 = [](int a) {
        return a;
    };
    
    ```
    
-   `SLS_Inline` (in configuration: `Inline`) Merge lambda into a single line if the lambda is argument of a function.
    
    ```
    auto lambda = [](int x, int y) {
        return x < y;
    };
    sort(a.begin(), a.end(), [](int x, int y) { return x < y; });
    
    ```
    
-   `SLS_All` (in configuration: `All`) Merge all lambdas fitting on a single line.
    
    ```
    auto lambda = [](int a) {};
    auto lambda2 = [](int a) { return a; };
    
    ```
    

__AllowShortLoopsOnASingleLine__ (`Boolean`) clang-format 3.7

If `true`, `while (true) continue;` can be put on a single line.

__AlwaysBreakAfterDefinitionReturnType__ (`DefinitionReturnTypeBreakingStyle`) clang-format 3.7

The function definition return type breaking style to use. This option is __deprecated__ and is retained for backwards compatibility.

Possible values:

-   `DRTBS_None` (in configuration: `None`) Break after return type automatically. `PenaltyReturnTypeOnItsOwnLine` is taken into account.
-   `DRTBS_All` (in configuration: `All`) Always break after the return type.
-   `DRTBS_TopLevel` (in configuration: `TopLevel`) Always break after the return types of top-level functions.

__AlwaysBreakAfterReturnType__ (`ReturnTypeBreakingStyle`) clang-format 3.8

The function declaration return type breaking style to use.

Possible values:

-   `RTBS_None` (in configuration: `None`) Break after return type automatically. `PenaltyReturnTypeOnItsOwnLine` is taken into account.
    
    ```
    class A {
      int f() { return 0; };
    };
    int f();
    int f() { return 1; }
    
    ```
    
-   `RTBS_All` (in configuration: `All`) Always break after the return type.
    
    ```
    class A {
      int
      f() {
        return 0;
      };
    };
    int
    f();
    int
    f() {
      return 1;
    }
    
    ```
    
-   `RTBS_TopLevel` (in configuration: `TopLevel`) Always break after the return types of top-level functions.
    
    ```
    class A {
      int f() { return 0; };
    };
    int
    f();
    int
    f() {
      return 1;
    }
    
    ```
    
-   `RTBS_AllDefinitions` (in configuration: `AllDefinitions`) Always break after the return type of function definitions.
    
    ```
    class A {
      int
      f() {
        return 0;
      };
    };
    int f();
    int
    f() {
      return 1;
    }
    
    ```
    
-   `RTBS_TopLevelDefinitions` (in configuration: `TopLevelDefinitions`) Always break after the return type of top-level definitions.
    
    ```
    class A {
      int f() { return 0; };
    };
    int f();
    int
    f() {
      return 1;
    }
    
    ```
    

__AlwaysBreakBeforeMultilineStrings__ (`Boolean`) clang-format 3.4

If `true`, always break before multiline string literals.

This flag is mean to make cases where there are multiple multiline strings in a file look more consistent. Thus, it will only take effect if wrapping the string at that point leads to it being indented `ContinuationIndentWidth` spaces from the start of the line.

```
true:                                  false:
aaaa =                         vs.     aaaa = "bbbb"
    "bbbb"                                    "cccc";
    "cccc";

```

__AlwaysBreakTemplateDeclarations__ (`BreakTemplateDeclarationsStyle`) clang-format 3.4

The template declaration breaking style to use.

Possible values:

-   `BTDS_No` (in configuration: `No`) Do not force break before declaration. `PenaltyBreakTemplateDeclaration` is taken into account.
    
    ```
    template <typename T> T foo() {
    }
    template <typename T> T foo(int aaaaaaaaaaaaaaaaaaaaa,
                                int bbbbbbbbbbbbbbbbbbbbb) {
    }
    
    ```
    
-   `BTDS_MultiLine` (in configuration: `MultiLine`) Force break after template declaration only when the following declaration spans multiple lines.
    
    ```
    template <typename T> T foo() {
    }
    template <typename T>
    T foo(int aaaaaaaaaaaaaaaaaaaaa,
          int bbbbbbbbbbbbbbbbbbbbb) {
    }
    
    ```
    
-   `BTDS_Yes` (in configuration: `Yes`) Always break after template declaration.
    
    ```
    template <typename T>
    T foo() {
    }
    template <typename T>
    T foo(int aaaaaaaaaaaaaaaaaaaaa,
          int bbbbbbbbbbbbbbbbbbbbb) {
    }
    
    ```
    

__AttributeMacros__ (`List of Strings`) clang-format 12

A vector of strings that should be interpreted as attributes/qualifiers instead of identifiers. This can be useful for language extensions or static analyzer annotations.

For example:

```
x = (char *__capability)&y;
int function(void) __ununsed;
void only_writes_to_buffer(char *__output buffer);

```

In the .clang-format configuration file, this can be configured like:

```
AttributeMacros: ['__capability', '__output', '__ununsed']

```

__BinPackArguments__ (`Boolean`) clang-format 3.7

If `false`, a function call’s arguments will either be all on the same line or will have one line each.

```
true:
void f() {
  f(aaaaaaaaaaaaaaaaaaaa, aaaaaaaaaaaaaaaaaaaa,
    aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa);
}

false:
void f() {
  f(aaaaaaaaaaaaaaaaaaaa,
    aaaaaaaaaaaaaaaaaaaa,
    aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa);
}

```

__BinPackParameters__ (`Boolean`) clang-format 3.7

If `false`, a function declaration’s or function definition’s parameters will either all be on the same line or will have one line each.

```
true:
void f(int aaaaaaaaaaaaaaaaaaaa, int aaaaaaaaaaaaaaaaaaaa,
       int aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) {}

false:
void f(int aaaaaaaaaaaaaaaaaaaa,
       int aaaaaaaaaaaaaaaaaaaa,
       int aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa) {}

```

__BitFieldColonSpacing__ (`BitFieldColonSpacingStyle`) clang-format 12

The BitFieldColonSpacingStyle to use for bitfields.

Possible values:

-   `BFCS_Both` (in configuration: `Both`) Add one space on each side of the `:`
    
-   `BFCS_None` (in configuration: `None`) Add no space around the `:` (except when needed for `AlignConsecutiveBitFields`).
    
-   `BFCS_Before` (in configuration: `Before`) Add space before the `:` only
    
-   `BFCS_After` (in configuration: `After`) Add space after the `:` only (space may be added before if needed for `AlignConsecutiveBitFields`).
    

__BraceWrapping__ (`BraceWrappingFlags`) clang-format 3.8

Control of individual brace wrapping cases.

If `BreakBeforeBraces` is set to `BS_Custom`, use this to specify how each individual brace case should be handled. Otherwise, this is ignored.

```
# Example of usage:
BreakBeforeBraces: Custom
BraceWrapping:
  AfterEnum: true
  AfterStruct: false
  SplitEmptyFunction: false

```

Nested configuration flags:

Precise control over the wrapping of braces.

```
# Should be declared this way:
BreakBeforeBraces: Custom
BraceWrapping:
    AfterClass: true

```

-   `bool AfterCaseLabel` Wrap case labels.
    
    ```
    false:                                true:
    switch (foo) {                vs.     switch (foo) {
      case 1: {                             case 1:
        bar();                              {
        break;                                bar();
      }                                       break;
      default: {                            }
        plop();                             default:
      }                                     {
    }                                         plop();
                                            }
                                          }
    
    ```
    
-   `bool AfterClass` Wrap class definitions.
    
    ```
    true:
    class foo
    {};
    
    false:
    class foo {};
    
    ```
    
-   `BraceWrappingAfterControlStatementStyle AfterControlStatement` Wrap control statements (`if`/`for`/`while`/`switch`/..).
    
    Possible values:
    
    -   `BWACS_Never` (in configuration: `Never`) Never wrap braces after a control statement.
        
        ```
        if (foo()) {
        } else {
        }
        for (int i = 0; i < 10; ++i) {
        }
        
        ```
        
    -   `BWACS_MultiLine` (in configuration: `MultiLine`) Only wrap braces after a multi-line control statement.
        
        ```
        if (foo && bar &&
            baz)
        {
          quux();
        }
        while (foo || bar) {
        }
        
        ```
        
    -   `BWACS_Always` (in configuration: `Always`) Always wrap braces after a control statement.
        
        ```
        if (foo())
        {
        } else
        {}
        for (int i = 0; i < 10; ++i)
        {}
        
        ```
        
-   `bool AfterEnum` Wrap enum definitions.
    
    ```
    true:
    enum X : int
    {
      B
    };
    
    false:
    enum X : int { B };
    
    ```
    
-   `bool AfterFunction` Wrap function definitions.
    
    ```
    true:
    void foo()
    {
      bar();
      bar2();
    }
    
    false:
    void foo() {
      bar();
      bar2();
    }
    
    ```
    
-   `bool AfterNamespace` Wrap namespace definitions.
    
    ```
    true:
    namespace
    {
    int foo();
    int bar();
    }
    
    false:
    namespace {
    int foo();
    int bar();
    }
    
    ```
    
-   `bool AfterObjCDeclaration` Wrap ObjC definitions (interfaces, implementations…). @autoreleasepool and @synchronized blocks are wrapped according to AfterControlStatement flag.
    
-   `bool AfterStruct` Wrap struct definitions.
    
    ```
    true:
    struct foo
    {
      int x;
    };
    
    false:
    struct foo {
      int x;
    };
    
    ```
    
-   `bool AfterUnion` Wrap union definitions.
    
    ```
    true:
    union foo
    {
      int x;
    }
    
    false:
    union foo {
      int x;
    }
    
    ```
    
-   `bool AfterExternBlock` Wrap extern blocks.
    
    ```
    true:
    extern "C"
    {
      int foo();
    }
    
    false:
    extern "C" {
    int foo();
    }
    
    ```
    
-   `bool BeforeCatch` Wrap before `catch`.
    
    ```
    true:
    try {
      foo();
    }
    catch () {
    }
    
    false:
    try {
      foo();
    } catch () {
    }
    
    ```
    
-   `bool BeforeElse` Wrap before `else`.
    
    ```
    true:
    if (foo()) {
    }
    else {
    }
    
    false:
    if (foo()) {
    } else {
    }
    
    ```
    
-   `bool BeforeLambdaBody` Wrap lambda block.
    
    ```
    true:
    connect(
      []()
      {
        foo();
        bar();
      });
    
    false:
    connect([]() {
      foo();
      bar();
    });
    
    ```
    
-   `bool BeforeWhile` Wrap before `while`.
    
    ```
    true:
    do {
      foo();
    }
    while (1);
    
    false:
    do {
      foo();
    } while (1);
    
    ```
    
-   `bool IndentBraces` Indent the wrapped braces themselves.
    
-   `bool SplitEmptyFunction` If `false`, empty function body can be put on a single line. This option is used only if the opening brace of the function has already been wrapped, i.e. the AfterFunction brace wrapping mode is set, and the function could/should not be put on a single line (as per AllowShortFunctionsOnASingleLine and constructor formatting options).
    
    ```
    false:          true:
    int f()   vs.   int f()
    {}              {
                    }
    
    ```
    
-   `bool SplitEmptyRecord` If `false`, empty record (e.g. class, struct or union) body can be put on a single line. This option is used only if the opening brace of the record has already been wrapped, i.e. the AfterClass (for classes) brace wrapping mode is set.
    
    ```
    false:           true:
    class Foo   vs.  class Foo
    {}               {
                     }
    
    ```
    
-   `bool SplitEmptyNamespace` If `false`, empty namespace body can be put on a single line. This option is used only if the opening brace of the namespace has already been wrapped, i.e. the AfterNamespace brace wrapping mode is set.
    
    ```
    false:               true:
    namespace Foo   vs.  namespace Foo
    {}                   {
                         }
    
    ```
    

__BreakAfterJavaFieldAnnotations__ (`Boolean`) clang-format 3.8

Break after each annotation on a field in Java files.

```
true:                                  false:
@Partial                       vs.     @Partial @Mock DataLoad loader;
@Mock
DataLoad loader;

```

__BreakArrays__ (`Boolean`) clang-format 16

If `true`, clang-format will always break after a Json array \[ otherwise it will scan until the closing \] to determine if it should add newlines between elements (prettier compatible).

NOTE: This is currently only for formatting JSON.

```
true:                                  false:
[                          vs.      [1, 2, 3, 4]
  1,
  2,
  3,
  4
]

```

__BreakBeforeBinaryOperators__ (`BinaryOperatorStyle`) clang-format 3.6

The way to wrap binary operators.

Possible values:

-   `BOS_None` (in configuration: `None`) Break after operators.
    
    ```
    LooooooooooongType loooooooooooooooooooooongVariable =
        someLooooooooooooooooongFunction();
    
    bool value = aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa +
                         aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ==
                     aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa &&
                 aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa >
                     ccccccccccccccccccccccccccccccccccccccccc;
    
    ```
    
-   `BOS_NonAssignment` (in configuration: `NonAssignment`) Break before operators that aren’t assignments.
    
    ```
    LooooooooooongType loooooooooooooooooooooongVariable =
        someLooooooooooooooooongFunction();
    
    bool value = aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                         + aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                     == aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                 && aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                        > ccccccccccccccccccccccccccccccccccccccccc;
    
    ```
    
-   `BOS_All` (in configuration: `All`) Break before operators.
    
    ```
    LooooooooooongType loooooooooooooooooooooongVariable
        = someLooooooooooooooooongFunction();
    
    bool value = aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                         + aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                     == aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                 && aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                        > ccccccccccccccccccccccccccccccccccccccccc;
    
    ```
    

__BreakBeforeBraces__ (`BraceBreakingStyle`) clang-format 3.7

The brace breaking style to use.

Possible values:

-   `BS_Attach` (in configuration: `Attach`) Always attach braces to surrounding context.
    
    ```
    namespace N {
    enum E {
      E1,
      E2,
    };
    
    class C {
    public:
      C();
    };
    
    bool baz(int i) {
      try {
        do {
          switch (i) {
          case 1: {
            foobar();
            break;
          }
          default: {
            break;
          }
          }
        } while (--i);
        return true;
      } catch (...) {
        handleError();
        return false;
      }
    }
    
    void foo(bool b) {
      if (b) {
        baz(2);
      } else {
        baz(5);
      }
    }
    
    void bar() { foo(true); }
    } // namespace N
    
    ```
    
-   `BS_Linux` (in configuration: `Linux`) Like `Attach`, but break before braces on function, namespace and class definitions.
    
    ```
    namespace N
    {
    enum E {
      E1,
      E2,
    };
    
    class C
    {
    public:
      C();
    };
    
    bool baz(int i)
    {
      try {
        do {
          switch (i) {
          case 1: {
            foobar();
            break;
          }
          default: {
            break;
          }
          }
        } while (--i);
        return true;
      } catch (...) {
        handleError();
        return false;
      }
    }
    
    void foo(bool b)
    {
      if (b) {
        baz(2);
      } else {
        baz(5);
      }
    }
    
    void bar() { foo(true); }
    } // namespace N
    
    ```
    
-   `BS_Mozilla` (in configuration: `Mozilla`) Like `Attach`, but break before braces on enum, function, and record definitions.
    
    ```
    namespace N {
    enum E
    {
      E1,
      E2,
    };
    
    class C
    {
    public:
      C();
    };
    
    bool baz(int i)
    {
      try {
        do {
          switch (i) {
          case 1: {
            foobar();
            break;
          }
          default: {
            break;
          }
          }
        } while (--i);
        return true;
      } catch (...) {
        handleError();
        return false;
      }
    }
    
    void foo(bool b)
    {
      if (b) {
        baz(2);
      } else {
        baz(5);
      }
    }
    
    void bar() { foo(true); }
    } // namespace N
    
    ```
    
-   `BS_Stroustrup` (in configuration: `Stroustrup`) Like `Attach`, but break before function definitions, `catch`, and `else`.
    
    ```
    namespace N {
    enum E {
      E1,
      E2,
    };
    
    class C {
    public:
      C();
    };
    
    bool baz(int i)
    {
      try {
        do {
          switch (i) {
          case 1: {
            foobar();
            break;
          }
          default: {
            break;
          }
          }
        } while (--i);
        return true;
      }
      catch (...) {
        handleError();
        return false;
      }
    }
    
    void foo(bool b)
    {
      if (b) {
        baz(2);
      }
      else {
        baz(5);
      }
    }
    
    void bar() { foo(true); }
    } // namespace N
    
    ```
    
-   `BS_Allman` (in configuration: `Allman`) Always break before braces.
    
    ```
    namespace N
    {
    enum E
    {
      E1,
      E2,
    };
    
    class C
    {
    public:
      C();
    };
    
    bool baz(int i)
    {
      try
      {
        do
        {
          switch (i)
          {
          case 1:
          {
            foobar();
            break;
          }
          default:
          {
            break;
          }
          }
        } while (--i);
        return true;
      }
      catch (...)
      {
        handleError();
        return false;
      }
    }
    
    void foo(bool b)
    {
      if (b)
      {
        baz(2);
      }
      else
      {
        baz(5);
      }
    }
    
    void bar() { foo(true); }
    } // namespace N
    
    ```
    
-   `BS_Whitesmiths` (in configuration: `Whitesmiths`) Like `Allman` but always indent braces and line up code with braces.
    
    ```
    namespace N
      {
    enum E
      {
      E1,
      E2,
      };
    
    class C
      {
    public:
      C();
      };
    
    bool baz(int i)
      {
      try
        {
        do
          {
          switch (i)
            {
            case 1:
            {
            foobar();
            break;
            }
            default:
            {
            break;
            }
            }
          } while (--i);
        return true;
        }
      catch (...)
        {
        handleError();
        return false;
        }
      }
    
    void foo(bool b)
      {
      if (b)
        {
        baz(2);
        }
      else
        {
        baz(5);
        }
      }
    
    void bar() { foo(true); }
      } // namespace N
    
    ```
    
-   `BS_GNU` (in configuration: `GNU`) Always break before braces and add an extra level of indentation to braces of control statements, not to those of class, function or other definitions.
    
    ```
    namespace N
    {
    enum E
    {
      E1,
      E2,
    };
    
    class C
    {
    public:
      C();
    };
    
    bool baz(int i)
    {
      try
        {
          do
            {
              switch (i)
                {
                case 1:
                  {
                    foobar();
                    break;
                  }
                default:
                  {
                    break;
                  }
                }
            }
          while (--i);
          return true;
        }
      catch (...)
        {
          handleError();
          return false;
        }
    }
    
    void foo(bool b)
    {
      if (b)
        {
          baz(2);
        }
      else
        {
          baz(5);
        }
    }
    
    void bar() { foo(true); }
    } // namespace N
    
    ```
    
-   `BS_WebKit` (in configuration: `WebKit`) Like `Attach`, but break before functions.
    
    ```
    namespace N {
    enum E {
      E1,
      E2,
    };
    
    class C {
    public:
      C();
    };
    
    bool baz(int i)
    {
      try {
        do {
          switch (i) {
          case 1: {
            foobar();
            break;
          }
          default: {
            break;
          }
          }
        } while (--i);
        return true;
      } catch (...) {
        handleError();
        return false;
      }
    }
    
    void foo(bool b)
    {
      if (b) {
        baz(2);
      } else {
        baz(5);
      }
    }
    
    void bar() { foo(true); }
    } // namespace N
    
    ```
    
-   `BS_Custom` (in configuration: `Custom`) Configure each individual brace in BraceWrapping.
    

__BreakBeforeConceptDeclarations__ (`BreakBeforeConceptDeclarationsStyle`) clang-format 12

The concept declaration style to use.

Possible values:

-   `BBCDS_Never` (in configuration: `Never`) Keep the template declaration line together with `concept`.
    
    ```
    template <typename T> concept C = ...;
    
    ```
    
-   `BBCDS_Allowed` (in configuration: `Allowed`) Breaking between template declaration and `concept` is allowed. The actual behavior depends on the content and line breaking rules and penalities.
    
-   `BBCDS_Always` (in configuration: `Always`) Always break before `concept`, putting it in the line after the template declaration.
    
    ```
    template <typename T>
    concept C = ...;
    
    ```
    

__BreakBeforeInlineASMColon__ (`BreakBeforeInlineASMColonStyle`) clang-format 16

The inline ASM colon style to use.

Possible values:

-   `BBIAS_Never` (in configuration: `Never`) No break before inline ASM colon.
    
    ```
    asm volatile("string", : : val);
    
    ```
    
-   `BBIAS_OnlyMultiline` (in configuration: `OnlyMultiline`) Break before inline ASM colon if the line length is longer than column limit.
    
    ```
    asm volatile("string", : : val);
    asm("cmoveq %1, %2, %[result]"
        : [result] "=r"(result)
        : "r"(test), "r"(new), "[result]"(old));
    
    ```
    
-   `BBIAS_Always` (in configuration: `Always`) Always break before inline ASM colon.
    
    ```
    asm volatile("string",
                 :
                 : val);
    
    ```
    

__BreakBeforeTernaryOperators__ (`Boolean`) clang-format 3.7

If `true`, ternary operators will be placed after line breaks.

```
true:
veryVeryVeryVeryVeryVeryVeryVeryVeryVeryVeryLongDescription
    ? firstValue
    : SecondValueVeryVeryVeryVeryLong;

false:
veryVeryVeryVeryVeryVeryVeryVeryVeryVeryVeryLongDescription ?
    firstValue :
    SecondValueVeryVeryVeryVeryLong;

```

__BreakConstructorInitializers__ (`BreakConstructorInitializersStyle`) clang-format 5

The break constructor initializers style to use.

Possible values:

-   `BCIS_BeforeColon` (in configuration: `BeforeColon`) Break constructor initializers before the colon and after the commas.
    
    ```
    Constructor()
        : initializer1(),
          initializer2()
    
    ```
    
-   `BCIS_BeforeComma` (in configuration: `BeforeComma`) Break constructor initializers before the colon and commas, and align the commas with the colon.
    
    ```
    Constructor()
        : initializer1()
        , initializer2()
    
    ```
    
-   `BCIS_AfterColon` (in configuration: `AfterColon`) Break constructor initializers after the colon and commas.
    
    ```
    Constructor() :
        initializer1(),
        initializer2()
    
    ```
    

__BreakInheritanceList__ (`BreakInheritanceListStyle`) clang-format 7

The inheritance list style to use.

Possible values:

-   `BILS_BeforeColon` (in configuration: `BeforeColon`) Break inheritance list before the colon and after the commas.
    
    ```
    class Foo
        : Base1,
          Base2
    {};
    
    ```
    
-   `BILS_BeforeComma` (in configuration: `BeforeComma`) Break inheritance list before the colon and commas, and align the commas with the colon.
    
    ```
    class Foo
        : Base1
        , Base2
    {};
    
    ```
    
-   `BILS_AfterColon` (in configuration: `AfterColon`) Break inheritance list after the colon and commas.
    
    ```
    class Foo :
        Base1,
        Base2
    {};
    
    ```
    
-   `BILS_AfterComma` (in configuration: `AfterComma`) Break inheritance list only after the commas.
    
    ```
    class Foo : Base1,
                Base2
    {};
    
    ```
    

__BreakStringLiterals__ (`Boolean`) clang-format 3.9

Allow breaking string literals when formatting.

```
true:
const char* x = "veryVeryVeryVeryVeryVe"
                "ryVeryVeryVeryVeryVery"
                "VeryLongString";

false:
const char* x =
  "veryVeryVeryVeryVeryVeryVeryVeryVeryVeryVeryVeryLongString";

```

__ColumnLimit__ (`Unsigned`) clang-format 3.7

The column limit.

A column limit of `0` means that there is no column limit. In this case, clang-format will respect the input’s line breaking decisions within statements unless they contradict other rules.

__CommentPragmas__ (`String`) clang-format 3.7

A regular expression that describes comments with special meaning, which should not be split into lines or otherwise changed.

```
// CommentPragmas: '^ FOOBAR pragma:'
// Will leave the following line unaffected
#include <vector> // FOOBAR pragma: keep

```

__CompactNamespaces__ (`Boolean`) clang-format 5

If `true`, consecutive namespace declarations will be on the same line. If `false`, each namespace is declared on a new line.

```
true:
namespace Foo { namespace Bar {
}}

false:
namespace Foo {
namespace Bar {
}
}

```

If it does not fit on a single line, the overflowing namespaces get wrapped:

```
namespace Foo { namespace Bar {
namespace Extra {
}}}

```

__ConstructorInitializerAllOnOneLineOrOnePerLine__ (`Boolean`) clang-format 3.7

This option is __deprecated__. See `CurrentLine` of `PackConstructorInitializers`.

__ConstructorInitializerIndentWidth__ (`Unsigned`) clang-format 3.7

The number of characters to use for indentation of constructor initializer lists as well as inheritance lists.

__ContinuationIndentWidth__ (`Unsigned`) clang-format 3.7

Indent width for line continuations.

```
ContinuationIndentWidth: 2

int i =         //  VeryVeryVeryVeryVeryLongComment
  longFunction( // Again a long comment
    arg);

```

__Cpp11BracedListStyle__ (`Boolean`) clang-format 3.4

If `true`, format braced lists as best suited for C++11 braced lists.

Important differences: - No spaces inside the braced list. - No line break before the closing brace. - Indentation with the continuation indent, not with the block indent.

Fundamentally, C++11 braced lists are formatted exactly like function calls would be formatted in their place. If the braced list follows a name (e.g. a type or variable name), clang-format formats as if the `{}` were the parentheses of a function call with that name. If there is no name, a zero-length name is assumed.

```
true:                                  false:
vector<int> x{1, 2, 3, 4};     vs.     vector<int> x{ 1, 2, 3, 4 };
vector<T> x{{}, {}, {}, {}};           vector<T> x{ {}, {}, {}, {} };
f(MyMap[{composite, key}]);            f(MyMap[{ composite, key }]);
new int[3]{1, 2, 3};                   new int[3]{ 1, 2, 3 };

```

__DeriveLineEnding__ (`Boolean`) clang-format 10

Analyze the formatted file for the most used line ending (`\r\n` or `\n`). `UseCRLF` is only used as a fallback if none can be derived.

__DerivePointerAlignment__ (`Boolean`) clang-format 3.7

If `true`, analyze the formatted file for the most common alignment of `&` and `*`. Pointer and reference alignment styles are going to be updated according to the preferences found in the file. `PointerAlignment` is then used only as fallback.

__DisableFormat__ (`Boolean`) clang-format 3.7

Disables formatting completely.

__EmptyLineAfterAccessModifier__ (`EmptyLineAfterAccessModifierStyle`) clang-format 13

Defines when to put an empty line after access modifiers. `EmptyLineBeforeAccessModifier` configuration handles the number of empty lines between two access modifiers.

Possible values:

-   `ELAAMS_Never` (in configuration: `Never`) Remove all empty lines after access modifiers.
    
    ```
    struct foo {
    private:
      int i;
    protected:
      int j;
      /* comment */
    public:
      foo() {}
    private:
    protected:
    };
    
    ```
    
-   `ELAAMS_Leave` (in configuration: `Leave`) Keep existing empty lines after access modifiers. MaxEmptyLinesToKeep is applied instead.
    
-   `ELAAMS_Always` (in configuration: `Always`) Always add empty line after access modifiers if there are none. MaxEmptyLinesToKeep is applied also.
    
    ```
    struct foo {
    private:
    
      int i;
    protected:
    
      int j;
      /* comment */
    public:
    
      foo() {}
    private:
    
    protected:
    
    };
    
    ```
    

__EmptyLineBeforeAccessModifier__ (`EmptyLineBeforeAccessModifierStyle`) clang-format 12

Defines in which cases to put empty line before access modifiers.

Possible values:

-   `ELBAMS_Never` (in configuration: `Never`) Remove all empty lines before access modifiers.
    
    ```
    struct foo {
    private:
      int i;
    protected:
      int j;
      /* comment */
    public:
      foo() {}
    private:
    protected:
    };
    
    ```
    
-   `ELBAMS_Leave` (in configuration: `Leave`) Keep existing empty lines before access modifiers.
    
-   `ELBAMS_LogicalBlock` (in configuration: `LogicalBlock`) Add empty line only when access modifier starts a new logical block. Logical block is a group of one or more member fields or functions.
    
    ```
    struct foo {
    private:
      int i;
    
    protected:
      int j;
      /* comment */
    public:
      foo() {}
    
    private:
    protected:
    };
    
    ```
    
-   `ELBAMS_Always` (in configuration: `Always`) Always add empty line before access modifiers unless access modifier is at the start of struct or class definition.
    
    ```
    struct foo {
    private:
      int i;
    
    protected:
      int j;
      /* comment */
    
    public:
      foo() {}
    
    private:
    
    protected:
    };
    
    ```
    

__ExperimentalAutoDetectBinPacking__ (`Boolean`) clang-format 3.7

If `true`, clang-format detects whether function calls and definitions are formatted with one parameter per line.

Each call can be bin-packed, one-per-line or inconclusive. If it is inconclusive, e.g. completely on one line, but a decision needs to be made, clang-format analyzes whether there are other bin-packed cases in the input file and act accordingly.

NOTE: This is an experimental flag, that might go away or be renamed. Do not use this in config files, etc. Use at your own risk.

__FixNamespaceComments__ (`Boolean`) clang-format 5

If `true`, clang-format adds missing namespace end comments for namespaces and fixes invalid existing ones. This doesn’t affect short namespaces, which are controlled by `ShortNamespaceLines`.

```
true:                                  false:
namespace longNamespace {      vs.     namespace longNamespace {
void foo();                            void foo();
void bar();                            void bar();
} // namespace a                       }
namespace shortNamespace {             namespace shortNamespace {
void baz();                            void baz();
}                                      }

```

__ForEachMacros__ (`List of Strings`) clang-format 3.7

A vector of macros that should be interpreted as foreach loops instead of as function calls.

These are expected to be macros of the form:

```
FOREACH(<variable-declaration>, ...)
  <loop-body>

```

In the .clang-format configuration file, this can be configured like:

```
ForEachMacros: ['RANGES_FOR', 'FOREACH']

```

For example: BOOST\_FOREACH.

__IfMacros__ (`List of Strings`) clang-format 13

A vector of macros that should be interpreted as conditionals instead of as function calls.

These are expected to be macros of the form:

```
IF(...)
  <conditional-body>
else IF(...)
  <conditional-body>

```

In the .clang-format configuration file, this can be configured like:

For example: [KJ\_IF\_MAYBE][8]

__IncludeBlocks__ (`IncludeBlocksStyle`) clang-format 6

Dependent on the value, multiple `#include` blocks can be sorted as one and divided based on category.

Possible values:

-   `IBS_Preserve` (in configuration: `Preserve`) Sort each `#include` block separately.
    
    ```
    #include "b.h"               into      #include "b.h"
    
    #include <lib/main.h>                  #include "a.h"
    #include "a.h"                         #include <lib/main.h>
    
    ```
    
-   `IBS_Merge` (in configuration: `Merge`) Merge multiple `#include` blocks together and sort as one.
    
    ```
    #include "b.h"               into      #include "a.h"
                                           #include "b.h"
    #include <lib/main.h>                  #include <lib/main.h>
    #include "a.h"
    
    ```
    
-   `IBS_Regroup` (in configuration: `Regroup`) Merge multiple `#include` blocks together and sort as one. Then split into groups based on category priority. See `IncludeCategories`.
    
    ```
    #include "b.h"               into      #include "a.h"
                                           #include "b.h"
    #include <lib/main.h>
    #include "a.h"                         #include <lib/main.h>
    
    ```
    

__IncludeCategories__ (`List of IncludeCategories`) clang-format 3.8

Regular expressions denoting the different `#include` categories used for ordering `#includes`.

[POSIX extended][9] regular expressions are supported.

These regular expressions are matched against the filename of an include (including the <> or “”) in order. The value belonging to the first matching regular expression is assigned and `#includes` are sorted first according to increasing category number and then alphabetically within each category.

If none of the regular expressions match, INT\_MAX is assigned as category. The main header for a source file automatically gets category 0. so that it is generally kept at the beginning of the `#includes` ([https://llvm.org/docs/CodingStandards.html#include-style][10]). However, you can also assign negative priorities if you have certain headers that always need to be first.

There is a third and optional field `SortPriority` which can used while `IncludeBlocks = IBS_Regroup` to define the priority in which `#includes` should be ordered. The value of `Priority` defines the order of `#include blocks` and also allows the grouping of `#includes` of different priority. `SortPriority` is set to the value of `Priority` as default if it is not assigned.

Each regular expression can be marked as case sensitive with the field `CaseSensitive`, per default it is not.

To configure this in the .clang-format file, use:

```
IncludeCategories:
  - Regex:           '^"(llvm|llvm-c|clang|clang-c)/'
    Priority:        2
    SortPriority:    2
    CaseSensitive:   true
  - Regex:           '^((<|")(gtest|gmock|isl|json)/)'
    Priority:        3
  - Regex:           '<[[:alnum:].]+>'
    Priority:        4
  - Regex:           '.*'
    Priority:        1
    SortPriority:    0

```

__IncludeIsMainRegex__ (`String`) clang-format 3.9

Specify a regular expression of suffixes that are allowed in the file-to-main-include mapping.

When guessing whether a #include is the “main” include (to assign category 0, see above), use this regex of allowed suffixes to the header stem. A partial match is done, so that: - “” means “arbitrary suffix” - “$” means “no suffix”

For example, if configured to “(\_test)?$”, then a header a.h would be seen as the “main” include in both a.cc and a\_test.cc.

__IncludeIsMainSourceRegex__ (`String`) clang-format 10

Specify a regular expression for files being formatted that are allowed to be considered “main” in the file-to-main-include mapping.

By default, clang-format considers files as “main” only when they end with: `.c`, `.cc`, `.cpp`, `.c++`, `.cxx`, `.m` or `.mm` extensions. For these files a guessing of “main” include takes place (to assign category 0, see above). This config option allows for additional suffixes and extensions for files to be considered as “main”.

For example, if this option is configured to `(Impl\.hpp)$`, then a file `ClassImpl.hpp` is considered “main” (in addition to `Class.c`, `Class.cc`, `Class.cpp` and so on) and “main include file” logic will be executed (with _IncludeIsMainRegex_ setting also being respected in later phase). Without this option set, `ClassImpl.hpp` would not have the main include file put on top before any other include.

__IndentAccessModifiers__ (`Boolean`) clang-format 13

Specify whether access modifiers should have their own indentation level.

When `false`, access modifiers are indented (or outdented) relative to the record members, respecting the `AccessModifierOffset`. Record members are indented one level below the record. When `true`, access modifiers get their own indentation level. As a consequence, record members are always indented 2 levels below the record, regardless of the access modifier presence. Value of the `AccessModifierOffset` is ignored.

```
false:                                 true:
class C {                      vs.     class C {
  class D {                                class D {
    void bar();                                void bar();
  protected:                                 protected:
    D();                                       D();
  };                                       };
public:                                  public:
  C();                                     C();
};                                     };
void foo() {                           void foo() {
  return 1;                              return 1;
}                                      }

```

__IndentCaseBlocks__ (`Boolean`) clang-format 11

Indent case label blocks one level from the case label.

When `false`, the block following the case label uses the same indentation level as for the case label, treating the case label the same as an if-statement. When `true`, the block gets indented as a scope block.

```
false:                                 true:
switch (fool) {                vs.     switch (fool) {
case 1: {                              case 1:
  bar();                                 {
} break;                                   bar();
default: {                               }
  plop();                                break;
}                                      default:
}                                        {
                                           plop();
                                         }
                                       }

```

__IndentCaseLabels__ (`Boolean`) clang-format 3.3

Indent case labels one level from the switch statement.

When `false`, use the same indentation level as for the switch statement. Switch statement body is always indented one level more than case labels (except the first block following the case label, which itself indents the code - unless IndentCaseBlocks is enabled).

```
false:                                 true:
switch (fool) {                vs.     switch (fool) {
case 1:                                  case 1:
  bar();                                   bar();
  break;                                   break;
default:                                 default:
  plop();                                  plop();
}                                      }

```

__IndentExternBlock__ (`IndentExternBlockStyle`) clang-format 11

IndentExternBlockStyle is the type of indenting of extern blocks.

Possible values:

-   `IEBS_AfterExternBlock` (in configuration: `AfterExternBlock`) Backwards compatible with AfterExternBlock’s indenting.
    
    ```
    IndentExternBlock: AfterExternBlock
    BraceWrapping.AfterExternBlock: true
    extern "C"
    {
        void foo();
    }
    
    ```
    
    ```
    IndentExternBlock: AfterExternBlock
    BraceWrapping.AfterExternBlock: false
    extern "C" {
    void foo();
    }
    
    ```
    
-   `IEBS_NoIndent` (in configuration: `NoIndent`) Does not indent extern blocks.
    
    ```
    extern "C" {
    void foo();
    }
    
    ```
    
-   `IEBS_Indent` (in configuration: `Indent`) Indents extern blocks.
    
    ```
    extern "C" {
      void foo();
    }
    
    ```
    

__IndentGotoLabels__ (`Boolean`) clang-format 10

Indent goto labels.

When `false`, goto labels are flushed left.

```
true:                                  false:
int f() {                      vs.     int f() {
  if (foo()) {                           if (foo()) {
  label1:                              label1:
    bar();                                 bar();
  }                                      }
label2:                                label2:
  return 1;                              return 1;
}                                      }

```

__IndentPPDirectives__ (`PPDirectiveIndentStyle`) clang-format 6

The preprocessor directive indenting style to use.

Possible values:

-   `PPDIS_None` (in configuration: `None`) Does not indent any directives.
    
    ```
    #if FOO
    #if BAR
    #include <foo>
    #endif
    #endif
    
    ```
    
-   `PPDIS_AfterHash` (in configuration: `AfterHash`) Indents directives after the hash.
    
    ```
    #if FOO
    #  if BAR
    #    include <foo>
    #  endif
    #endif
    
    ```
    
-   `PPDIS_BeforeHash` (in configuration: `BeforeHash`) Indents directives before the hash.
    
    ```
    #if FOO
      #if BAR
        #include <foo>
      #endif
    #endif
    
    ```
    

__IndentRequiresClause__ (`Boolean`) clang-format 15

Indent the requires clause in a template. This only applies when `RequiresClausePosition` is `OwnLine`, or `WithFollowing`.

In clang-format 12, 13 and 14 it was named `IndentRequires`.

```
true:
template <typename It>
  requires Iterator<It>
void sort(It begin, It end) {
  //....
}

false:
template <typename It>
requires Iterator<It>
void sort(It begin, It end) {
  //....
}

```

__IndentWidth__ (`Unsigned`) clang-format 3.7

The number of columns to use for indentation.

```
IndentWidth: 3

void f() {
   someFunction();
   if (true, false) {
      f();
   }
}

```

__IndentWrappedFunctionNames__ (`Boolean`) clang-format 3.7

Indent if a function definition or declaration is wrapped after the type.

```
true:
LoooooooooooooooooooooooooooooooooooooooongReturnType
    LoooooooooooooooooooooooooooooooongFunctionDeclaration();

false:
LoooooooooooooooooooooooooooooooooooooooongReturnType
LoooooooooooooooooooooooooooooooongFunctionDeclaration();

```

__InsertBraces__ (`Boolean`) clang-format 15

Insert braces after control statements (`if`, `else`, `for`, `do`, and `while`) in C++ unless the control statements are inside macro definitions or the braces would enclose preprocessor directives.

Warning

Setting this option to true could lead to incorrect code formatting due to clang-format’s lack of complete semantic information. As such, extra care should be taken to review code changes made by this option.

```
false:                                    true:

if (isa<FunctionDecl>(D))        vs.      if (isa<FunctionDecl>(D)) {
  handleFunctionDecl(D);                    handleFunctionDecl(D);
else if (isa<VarDecl>(D))                 } else if (isa<VarDecl>(D)) {
  handleVarDecl(D);                         handleVarDecl(D);
else                                      } else {
  return;                                   return;
                                          }

while (i--)                      vs.      while (i--) {
  for (auto *A : D.attrs())                 for (auto *A : D.attrs()) {
    handleAttr(A);                            handleAttr(A);
                                            }
                                          }

do                               vs.      do {
  --i;                                      --i;
while (i);                                } while (i);

```

__InsertTrailingCommas__ (`TrailingCommaStyle`) clang-format 11

If set to `TCS_Wrapped` will insert trailing commas in container literals (arrays and objects) that wrap across multiple lines. It is currently only available for JavaScript and disabled by default `TCS_None`. `InsertTrailingCommas` cannot be used together with `BinPackArguments` as inserting the comma disables bin-packing.

```
TSC_Wrapped:
const someArray = [
aaaaaaaaaaaaaaaaaaaaaaaaaa,
aaaaaaaaaaaaaaaaaaaaaaaaaa,
aaaaaaaaaaaaaaaaaaaaaaaaaa,
//                        ^ inserted
]

```

Possible values:

-   `TCS_None` (in configuration: `None`) Do not insert trailing commas.
-   `TCS_Wrapped` (in configuration: `Wrapped`) Insert trailing commas in container literals that were wrapped over multiple lines. Note that this is conceptually incompatible with bin-packing, because the trailing comma is used as an indicator that a container should be formatted one-per-line (i.e. not bin-packed). So inserting a trailing comma counteracts bin-packing.

__JavaImportGroups__ (`List of Strings`) clang-format 8

A vector of prefixes ordered by the desired groups for Java imports.

One group’s prefix can be a subset of another - the longest prefix is always matched. Within a group, the imports are ordered lexicographically. Static imports are grouped separately and follow the same group rules. By default, static imports are placed before non-static imports, but this behavior is changed by another option, `SortJavaStaticImport`.

In the .clang-format configuration file, this can be configured like in the following yaml example. This will result in imports being formatted as in the Java example below.

```
JavaImportGroups: ['com.example', 'com', 'org']

```

```
import static com.example.function1;

import static com.test.function2;

import static org.example.function3;

import com.example.ClassA;
import com.example.Test;
import com.example.a.ClassB;

import com.test.ClassC;

import org.example.ClassD;

```

__JavaScriptQuotes__ (`JavaScriptQuoteStyle`) clang-format 3.9

The JavaScriptQuoteStyle to use for JavaScript strings.

Possible values:

-   `JSQS_Leave` (in configuration: `Leave`) Leave string quotes as they are.
    
    ```
    string1 = "foo";
    string2 = 'bar';
    
    ```
    
-   `JSQS_Single` (in configuration: `Single`) Always use single quotes.
    
    ```
    string1 = 'foo';
    string2 = 'bar';
    
    ```
    
-   `JSQS_Double` (in configuration: `Double`) Always use double quotes.
    
    ```
    string1 = "foo";
    string2 = "bar";
    
    ```
    

__JavaScriptWrapImports__ (`Boolean`) clang-format 3.9

Whether to wrap JavaScript import/export statements.

```
true:
import {
    VeryLongImportsAreAnnoying,
    VeryLongImportsAreAnnoying,
    VeryLongImportsAreAnnoying,
} from 'some/module.js'

false:
import {VeryLongImportsAreAnnoying, VeryLongImportsAreAnnoying, VeryLongImportsAreAnnoying,} from "some/module.js"

```

__KeepEmptyLinesAtTheStartOfBlocks__ (`Boolean`) clang-format 3.7

If true, the empty line at the start of blocks is kept.

```
true:                                  false:
if (foo) {                     vs.     if (foo) {
                                         bar();
  bar();                               }
}

```

__LambdaBodyIndentation__ (`LambdaBodyIndentationKind`) clang-format 13

The indentation style of lambda bodies. `Signature` (the default) causes the lambda body to be indented one additional level relative to the indentation level of the signature. `OuterScope` forces the lambda body to be indented one additional level relative to the parent scope containing the lambda signature. For callback-heavy code, it may improve readability to have the signature indented two levels and to use `OuterScope`. The KJ style guide requires `OuterScope`. [KJ style guide][11]

Possible values:

-   `LBI_Signature` (in configuration: `Signature`) Align lambda body relative to the lambda signature. This is the default.
    
    ```
    someMethod(
        [](SomeReallyLongLambdaSignatureArgument foo) {
          return;
        });
    
    ```
    
-   `LBI_OuterScope` (in configuration: `OuterScope`) Align lambda body relative to the indentation level of the outer scope the lambda signature resides in.
    
    ```
    someMethod(
        [](SomeReallyLongLambdaSignatureArgument foo) {
      return;
    });
    
    ```
    

__Language__ (`LanguageKind`) clang-format 3.5

Language, this format style is targeted at.

Possible values:

-   `LK_None` (in configuration: `None`) Do not use.
-   `LK_Cpp` (in configuration: `Cpp`) Should be used for C, C++.
-   `LK_CSharp` (in configuration: `CSharp`) Should be used for C#.
-   `LK_Java` (in configuration: `Java`) Should be used for Java.
-   `LK_JavaScript` (in configuration: `JavaScript`) Should be used for JavaScript.
-   `LK_Json` (in configuration: `Json`) Should be used for JSON.
-   `LK_ObjC` (in configuration: `ObjC`) Should be used for Objective-C, Objective-C++.
-   `LK_Proto` (in configuration: `Proto`) Should be used for Protocol Buffers ([https://developers.google.com/protocol-buffers/][12]).
-   `LK_TableGen` (in configuration: `TableGen`) Should be used for TableGen code.
-   `LK_TextProto` (in configuration: `TextProto`) Should be used for Protocol Buffer messages in text format ([https://developers.google.com/protocol-buffers/][13]).
-   `LK_Verilog` (in configuration: `Verilog`) Should be used for Verilog and SystemVerilog. [https://standards.ieee.org/ieee/1800/6700/][14] [https://sci-hub.st/10.1109/IEEESTD.2018.8299595][15]

__MacroBlockBegin__ (`String`) clang-format 3.7

A regular expression matching macros that start a block.

```
# With:
MacroBlockBegin: "^NS_MAP_BEGIN|\
NS_TABLE_HEAD$"
MacroBlockEnd: "^\
NS_MAP_END|\
NS_TABLE_.*_END$"

NS_MAP_BEGIN
  foo();
NS_MAP_END

NS_TABLE_HEAD
  bar();
NS_TABLE_FOO_END

# Without:
NS_MAP_BEGIN
foo();
NS_MAP_END

NS_TABLE_HEAD
bar();
NS_TABLE_FOO_END

```

__MacroBlockEnd__ (`String`) clang-format 3.7

A regular expression matching macros that end a block.

__MaxEmptyLinesToKeep__ (`Unsigned`) clang-format 3.7

The maximum number of consecutive empty lines to keep.

```
MaxEmptyLinesToKeep: 1         vs.     MaxEmptyLinesToKeep: 0
int f() {                              int f() {
  int = 1;                                 int i = 1;
                                           i = foo();
  i = foo();                               return i;
                                       }
  return i;
}

```

__NamespaceIndentation__ (`NamespaceIndentationKind`) clang-format 3.7

The indentation used for namespaces.

Possible values:

-   `NI_None` (in configuration: `None`) Don’t indent in namespaces.
    
    ```
    namespace out {
    int i;
    namespace in {
    int i;
    }
    }
    
    ```
    
-   `NI_Inner` (in configuration: `Inner`) Indent only in inner namespaces (nested in other namespaces).
    
    ```
    namespace out {
    int i;
    namespace in {
      int i;
    }
    }
    
    ```
    
-   `NI_All` (in configuration: `All`) Indent in all namespaces.
    
    ```
    namespace out {
      int i;
      namespace in {
        int i;
      }
    }
    
    ```
    

__NamespaceMacros__ (`List of Strings`) clang-format 9

A vector of macros which are used to open namespace blocks.

These are expected to be macros of the form:

```
NAMESPACE(<namespace-name>, ...) {
  <namespace-content>
}

```

For example: TESTSUITE

__ObjCBinPackProtocolList__ (`BinPackStyle`) clang-format 7

Controls bin-packing Objective-C protocol conformance list items into as few lines as possible when they go over `ColumnLimit`.

If `Auto` (the default), delegates to the value in `BinPackParameters`. If that is `true`, bin-packs Objective-C protocol conformance list items into as few lines as possible whenever they go over `ColumnLimit`.

If `Always`, always bin-packs Objective-C protocol conformance list items into as few lines as possible whenever they go over `ColumnLimit`.

If `Never`, lays out Objective-C protocol conformance list items onto individual lines whenever they go over `ColumnLimit`.

```
Always (or Auto, if BinPackParameters=true):
@interface ccccccccccccc () <
    ccccccccccccc, ccccccccccccc,
    ccccccccccccc, ccccccccccccc> {
}

Never (or Auto, if BinPackParameters=false):
@interface ddddddddddddd () <
    ddddddddddddd,
    ddddddddddddd,
    ddddddddddddd,
    ddddddddddddd> {
}

```

Possible values:

-   `BPS_Auto` (in configuration: `Auto`) Automatically determine parameter bin-packing behavior.
-   `BPS_Always` (in configuration: `Always`) Always bin-pack parameters.
-   `BPS_Never` (in configuration: `Never`) Never bin-pack parameters.

__ObjCBlockIndentWidth__ (`Unsigned`) clang-format 3.7

The number of characters to use for indentation of ObjC blocks.

```
ObjCBlockIndentWidth: 4

[operation setCompletionBlock:^{
    [self onOperationDone];
}];

```

__ObjCBreakBeforeNestedBlockParam__ (`Boolean`) clang-format 11

Break parameters list into lines when there is nested block parameters in a function call.

```
false:
 - (void)_aMethod
 {
     [self.test1 t:self w:self callback:^(typeof(self) self, NSNumber
     *u, NSNumber *v) {
         u = c;
     }]
 }
 true:
 - (void)_aMethod
 {
    [self.test1 t:self
                 w:self
        callback:^(typeof(self) self, NSNumber *u, NSNumber *v) {
             u = c;
         }]
 }

```

__ObjCSpaceAfterProperty__ (`Boolean`) clang-format 3.7

Add a space after `@property` in Objective-C, i.e. use `@property (readonly)` instead of `@property(readonly)`.

__ObjCSpaceBeforeProtocolList__ (`Boolean`) clang-format 3.7

Add a space in front of an Objective-C protocol list, i.e. use `Foo <Protocol>` instead of `Foo<Protocol>`.

__PPIndentWidth__ (`Integer`) clang-format 13

The number of columns to use for indentation of preprocessor statements. When set to -1 (default) `IndentWidth` is used also for preprocessor statements.

```
PPIndentWidth: 1

#ifdef __linux__
# define FOO
#else
# define BAR
#endif

```

__PackConstructorInitializers__ (`PackConstructorInitializersStyle`) clang-format 14

The pack constructor initializers style to use.

Possible values:

-   `PCIS_Never` (in configuration: `Never`) Always put each constructor initializer on its own line.
    
-   `PCIS_BinPack` (in configuration: `BinPack`) Bin-pack constructor initializers.
    
    ```
    Constructor()
        : aaaaaaaaaaaaaaaaaaaa(), bbbbbbbbbbbbbbbbbbbb(),
          cccccccccccccccccccc()
    
    ```
    
-   `PCIS_CurrentLine` (in configuration: `CurrentLine`) Put all constructor initializers on the current line if they fit. Otherwise, put each one on its own line.
    
    ```
    Constructor() : a(), b()
    
    Constructor()
        : aaaaaaaaaaaaaaaaaaaa(),
          bbbbbbbbbbbbbbbbbbbb(),
          ddddddddddddd()
    
    ```
    
-   `PCIS_NextLine` (in configuration: `NextLine`) Same as `PCIS_CurrentLine` except that if all constructor initializers do not fit on the current line, try to fit them on the next line.
    
    ```
    Constructor() : a(), b()
    
    Constructor()
        : aaaaaaaaaaaaaaaaaaaa(), bbbbbbbbbbbbbbbbbbbb(), ddddddddddddd()
    
    Constructor()
        : aaaaaaaaaaaaaaaaaaaa(),
          bbbbbbbbbbbbbbbbbbbb(),
          cccccccccccccccccccc()
    
    ```
    

__PenaltyBreakAssignment__ (`Unsigned`) clang-format 5

The penalty for breaking around an assignment operator.

__PenaltyBreakBeforeFirstCallParameter__ (`Unsigned`) clang-format 3.7

The penalty for breaking a function call after `call(`.

__PenaltyBreakComment__ (`Unsigned`) clang-format 3.7

The penalty for each line break introduced inside a comment.

__PenaltyBreakFirstLessLess__ (`Unsigned`) clang-format 3.7

The penalty for breaking before the first `<<`.

__PenaltyBreakOpenParenthesis__ (`Unsigned`) clang-format 14

The penalty for breaking after `(`.

__PenaltyBreakString__ (`Unsigned`) clang-format 3.7

The penalty for each line break introduced inside a string literal.

__PenaltyBreakTemplateDeclaration__ (`Unsigned`) clang-format 7

The penalty for breaking after template declaration.

__PenaltyExcessCharacter__ (`Unsigned`) clang-format 3.7

The penalty for each character outside of the column limit.

__PenaltyIndentedWhitespace__ (`Unsigned`) clang-format 12

Penalty for each character of whitespace indentation (counted relative to leading non-whitespace column).

__PenaltyReturnTypeOnItsOwnLine__ (`Unsigned`) clang-format 3.7

Penalty for putting the return type of a function onto its own line.

__PointerAlignment__ (`PointerAlignmentStyle`) clang-format 3.7

Pointer and reference alignment style.

Possible values:

-   `PAS_Left` (in configuration: `Left`) Align pointer to the left.
    
-   `PAS_Right` (in configuration: `Right`) Align pointer to the right.
    
-   `PAS_Middle` (in configuration: `Middle`) Align pointer in the middle.
    

__QualifierAlignment__ (`QualifierAlignmentStyle`) clang-format 14

Different ways to arrange specifiers and qualifiers (e.g. const/volatile).

Warning

Setting `QualifierAlignment` to something other than Leave, COULD lead to incorrect code formatting due to incorrect decisions made due to clang-formats lack of complete semantic information. As such extra care should be taken to review code changes made by the use of this option.

Possible values:

-   `QAS_Leave` (in configuration: `Leave`) Don’t change specifiers/qualifiers to either Left or Right alignment (default).
    
    ```
    int const a;
    const int *a;
    
    ```
    
-   `QAS_Left` (in configuration: `Left`) Change specifiers/qualifiers to be left-aligned.
    
    ```
    const int a;
    const int *a;
    
    ```
    
-   `QAS_Right` (in configuration: `Right`) Change specifiers/qualifiers to be right-aligned.
    
    ```
    int const a;
    int const *a;
    
    ```
    
-   `QAS_Custom` (in configuration: `Custom`) Change specifiers/qualifiers to be aligned based on `QualifierOrder`. With:
    
    ```
    QualifierOrder: ['inline', 'static', 'type', 'const']
    
    ```
    
    ```
    int const a;
    int const *a;
    
    ```
    

__QualifierOrder__ (`List of Strings`) clang-format 14

The order in which the qualifiers appear. Order is an array that can contain any of the following:

> -   const
> -   inline
> -   static
> -   constexpr
> -   volatile
> -   restrict
> -   type

Note: it MUST contain ‘type’. Items to the left of ‘type’ will be placed to the left of the type and aligned in the order supplied. Items to the right of ‘type’ will be placed to the right of the type and aligned in the order supplied.

```
QualifierOrder: ['inline', 'static', 'type', 'const', 'volatile' ]

```

__RawStringFormats__ (`List of RawStringFormats`) clang-format 6

Defines hints for detecting supported languages code blocks in raw strings.

A raw string with a matching delimiter or a matching enclosing function name will be reformatted assuming the specified language based on the style for that language defined in the .clang-format file. If no style has been defined in the .clang-format file for the specific language, a predefined style given by ‘BasedOnStyle’ is used. If ‘BasedOnStyle’ is not found, the formatting is based on llvm style. A matching delimiter takes precedence over a matching enclosing function name for determining the language of the raw string contents.

If a canonical delimiter is specified, occurrences of other delimiters for the same language will be updated to the canonical if possible.

There should be at most one specification per language and each delimiter and enclosing function should not occur in multiple specifications.

To configure this in the .clang-format file, use:

```
RawStringFormats:
  - Language: TextProto
      Delimiters:
        - 'pb'
        - 'proto'
      EnclosingFunctions:
        - 'PARSE_TEXT_PROTO'
      BasedOnStyle: google
  - Language: Cpp
      Delimiters:
        - 'cc'
        - 'cpp'
      BasedOnStyle: llvm
      CanonicalDelimiter: 'cc'

```

__ReferenceAlignment__ (`ReferenceAlignmentStyle`) clang-format 13

Reference alignment style (overrides `PointerAlignment` for references).

Possible values:

-   `RAS_Pointer` (in configuration: `Pointer`) Align reference like `PointerAlignment`.
    
-   `RAS_Left` (in configuration: `Left`) Align reference to the left.
    
-   `RAS_Right` (in configuration: `Right`) Align reference to the right.
    
-   `RAS_Middle` (in configuration: `Middle`) Align reference in the middle.
    

__ReflowComments__ (`Boolean`) clang-format 3.8

If `true`, clang-format will attempt to re-flow comments. That is it will touch a comment and _reflow_ long comments into new lines, trying to obey the `ColumnLimit`.

```
false:
// veryVeryVeryVeryVeryVeryVeryVeryVeryVeryVeryLongComment with plenty of information
/* second veryVeryVeryVeryVeryVeryVeryVeryVeryVeryVeryLongComment with plenty of information */

true:
// veryVeryVeryVeryVeryVeryVeryVeryVeryVeryVeryLongComment with plenty of
// information
/* second veryVeryVeryVeryVeryVeryVeryVeryVeryVeryVeryLongComment with plenty of
 * information */

```

__RemoveBracesLLVM__ (`Boolean`) clang-format 14

Remove optional braces of control statements (`if`, `else`, `for`, and `while`) in C++ according to the LLVM coding style.

Warning

This option will be renamed and expanded to support other styles.

Warning

Setting this option to true could lead to incorrect code formatting due to clang-format’s lack of complete semantic information. As such, extra care should be taken to review code changes made by this option.

```
false:                                     true:

if (isa<FunctionDecl>(D)) {        vs.     if (isa<FunctionDecl>(D))
  handleFunctionDecl(D);                     handleFunctionDecl(D);
} else if (isa<VarDecl>(D)) {              else if (isa<VarDecl>(D))
  handleVarDecl(D);                          handleVarDecl(D);
}

if (isa<VarDecl>(D)) {             vs.     if (isa<VarDecl>(D)) {
  for (auto *A : D.attrs()) {                for (auto *A : D.attrs())
    if (shouldProcessAttr(A)) {                if (shouldProcessAttr(A))
      handleAttr(A);                             handleAttr(A);
    }                                      }
  }
}

if (isa<FunctionDecl>(D)) {        vs.     if (isa<FunctionDecl>(D))
  for (auto *A : D.attrs()) {                for (auto *A : D.attrs())
    handleAttr(A);                             handleAttr(A);
  }
}

if (auto *D = (T)(D)) {            vs.     if (auto *D = (T)(D)) {
  if (shouldProcess(D)) {                    if (shouldProcess(D))
    handleVarDecl(D);                          handleVarDecl(D);
  } else {                                   else
    markAsIgnored(D);                          markAsIgnored(D);
  }                                        }
}

if (a) {                           vs.     if (a)
  b();                                       b();
} else {                                   else if (c)
  if (c) {                                   d();
    d();                                   else
  } else {                                   e();
    e();
  }
}

```

__RemoveSemicolon__ (`Boolean`) clang-format 16

Remove semicolons after the closing brace of a non-empty function.

Warning

Setting this option to true could lead to incorrect code formatting due to clang-format’s lack of complete semantic information. As such, extra care should be taken to review code changes made by this option.

```
false:                                     true:

int max(int a, int b) {                    int max(int a, int b) {
  return a > b ? a : b;                      return a > b ? a : b;
};                                         }

```

__RequiresClausePosition__ (`RequiresClausePositionStyle`) clang-format 15

The position of the `requires` clause.

Possible values:

-   `RCPS_OwnLine` (in configuration: `OwnLine`) Always put the `requires` clause on its own line.
    
    ```
    template <typename T>
    requires C<T>
    struct Foo {...
    
    template <typename T>
    requires C<T>
    void bar(T t) {...
    
    template <typename T>
    void baz(T t)
    requires C<T>
    {...
    
    ```
    
-   `RCPS_WithPreceding` (in configuration: `WithPreceding`) Try to put the clause together with the preceding part of a declaration. For class templates: stick to the template declaration. For function templates: stick to the template declaration. For function declaration followed by a requires clause: stick to the parameter list.
    
    ```
    template <typename T> requires C<T>
    struct Foo {...
    
    template <typename T> requires C<T>
    void bar(T t) {...
    
    template <typename T>
    void baz(T t) requires C<T>
    {...
    
    ```
    
-   `RCPS_WithFollowing` (in configuration: `WithFollowing`) Try to put the `requires` clause together with the class or function declaration.
    
    ```
    template <typename T>
    requires C<T> struct Foo {...
    
    template <typename T>
    requires C<T> void bar(T t) {...
    
    template <typename T>
    void baz(T t)
    requires C<T> {...
    
    ```
    
-   `RCPS_SingleLine` (in configuration: `SingleLine`) Try to put everything in the same line if possible. Otherwise normal line breaking rules take over.
    
    ```
    // Fitting:
    template <typename T> requires C<T> struct Foo {...
    
    template <typename T> requires C<T> void bar(T t) {...
    
    template <typename T> void bar(T t) requires C<T> {...
    
    // Not fitting, one possible example:
    template <typename LongName>
    requires C<LongName>
    struct Foo {...
    
    template <typename LongName>
    requires C<LongName>
    void bar(LongName ln) {
    
    template <typename LongName>
    void bar(LongName ln)
        requires C<LongName> {
    
    ```
    

__RequiresExpressionIndentation__ (`RequiresExpressionIndentationKind`) clang-format 16

The indentation used for requires expression bodies.

Possible values:

-   `REI_OuterScope` (in configuration: `OuterScope`) Align requires expression body relative to the indentation level of the outer scope the requires expression resides in. This is the default.
    
    ```
    template <typename T>
    concept C = requires(T t) {
      ...
    }
    
    ```
    
-   `REI_Keyword` (in configuration: `Keyword`) Align requires expression body relative to the requires keyword.
    
    ```
    template <typename T>
    concept C = requires(T t) {
                  ...
                }
    
    ```
    

__SeparateDefinitionBlocks__ (`SeparateDefinitionStyle`) clang-format 14

Specifies the use of empty lines to separate definition blocks, including classes, structs, enums, and functions.

```
Never                  v.s.     Always
#include <cstring>              #include <cstring>
struct Foo {
  int a, b, c;                  struct Foo {
};                                int a, b, c;
namespace Ns {                  };
class Bar {
public:                         namespace Ns {
  struct Foobar {               class Bar {
    int a;                      public:
    int b;                        struct Foobar {
  };                                int a;
private:                            int b;
  int t;                          };
  int method1() {
    // ...                      private:
  }                               int t;
  enum List {
    ITEM1,                        int method1() {
    ITEM2                           // ...
  };                              }
  template<typename T>
  int method2(T x) {              enum List {
    // ...                          ITEM1,
  }                                 ITEM2
  int i, j, k;                    };
  int method3(int par) {
    // ...                        template<typename T>
  }                               int method2(T x) {
};                                  // ...
class C {};                       }
}
                                  int i, j, k;

                                  int method3(int par) {
                                    // ...
                                  }
                                };

                                class C {};
                                }

```

Possible values:

-   `SDS_Leave` (in configuration: `Leave`) Leave definition blocks as they are.
-   `SDS_Always` (in configuration: `Always`) Insert an empty line between definition blocks.
-   `SDS_Never` (in configuration: `Never`) Remove any empty line between definition blocks.

__ShortNamespaceLines__ (`Unsigned`) clang-format 13

The maximal number of unwrapped lines that a short namespace spans. Defaults to 1.

This determines the maximum length of short namespaces by counting unwrapped lines (i.e. containing neither opening nor closing namespace brace) and makes “FixNamespaceComments” omit adding end comments for those.

```
ShortNamespaceLines: 1     vs.     ShortNamespaceLines: 0
namespace a {                      namespace a {
  int foo;                           int foo;
}                                  } // namespace a

ShortNamespaceLines: 1     vs.     ShortNamespaceLines: 0
namespace b {                      namespace b {
  int foo;                           int foo;
  int bar;                           int bar;
} // namespace b                   } // namespace b

```

__SortIncludes__ (`SortIncludesOptions`) clang-format 3.8

Controls if and how clang-format will sort `#includes`. If `Never`, includes are never sorted. If `CaseInsensitive`, includes are sorted in an ASCIIbetical or case insensitive fashion. If `CaseSensitive`, includes are sorted in an alphabetical or case sensitive fashion.

Possible values:

-   `SI_Never` (in configuration: `Never`) Includes are never sorted.
    
    ```
    #include "B/A.h"
    #include "A/B.h"
    #include "a/b.h"
    #include "A/b.h"
    #include "B/a.h"
    
    ```
    
-   `SI_CaseSensitive` (in configuration: `CaseSensitive`) Includes are sorted in an ASCIIbetical or case sensitive fashion.
    
    ```
    #include "A/B.h"
    #include "A/b.h"
    #include "B/A.h"
    #include "B/a.h"
    #include "a/b.h"
    
    ```
    
-   `SI_CaseInsensitive` (in configuration: `CaseInsensitive`) Includes are sorted in an alphabetical or case insensitive fashion.
    
    ```
    #include "A/B.h"
    #include "A/b.h"
    #include "a/b.h"
    #include "B/A.h"
    #include "B/a.h"
    
    ```
    

__SortJavaStaticImport__ (`SortJavaStaticImportOptions`) clang-format 12

When sorting Java imports, by default static imports are placed before non-static imports. If `JavaStaticImportAfterImport` is `After`, static imports are placed after non-static imports.

Possible values:

-   `SJSIO_Before` (in configuration: `Before`) Static imports are placed before non-static imports.
    
    ```
    import static org.example.function1;
    
    import org.example.ClassA;
    
    ```
    
-   `SJSIO_After` (in configuration: `After`) Static imports are placed after non-static imports.
    
    ```
    import org.example.ClassA;
    
    import static org.example.function1;
    
    ```
    

__SortUsingDeclarations__ (`Boolean`) clang-format 5

If `true`, clang-format will sort using declarations.

The order of using declarations is defined as follows: Split the strings by “::” and discard any initial empty strings. The last element of each list is a non-namespace name; all others are namespace names. Sort the lists of names lexicographically, where the sort order of individual names is that all non-namespace names come before all namespace names, and within those groups, names are in case-insensitive lexicographic order.

```
false:                                 true:
using std::cout;               vs.     using std::cin;
using std::cin;                        using std::cout;

```

__SpaceAfterCStyleCast__ (`Boolean`) clang-format 3.5

If `true`, a space is inserted after C style casts.

```
true:                                  false:
(int) i;                       vs.     (int)i;

```

__SpaceAfterLogicalNot__ (`Boolean`) clang-format 9

If `true`, a space is inserted after the logical not operator (`!`).

```
true:                                  false:
! someExpression();            vs.     !someExpression();

```

__SpaceAfterTemplateKeyword__ (`Boolean`) clang-format 4

If `true`, a space will be inserted after the ‘template’ keyword.

```
true:                                  false:
template <int> void foo();     vs.     template<int> void foo();

```

__SpaceAroundPointerQualifiers__ (`SpaceAroundPointerQualifiersStyle`) clang-format 12

Defines in which cases to put a space before or after pointer qualifiers

Possible values:

-   `SAPQ_Default` (in configuration: `Default`) Don’t ensure spaces around pointer qualifiers and use PointerAlignment instead.
    
    ```
    PointerAlignment: Left                 PointerAlignment: Right
    void* const* x = NULL;         vs.     void *const *x = NULL;
    
    ```
    
-   `SAPQ_Before` (in configuration: `Before`) Ensure that there is a space before pointer qualifiers.
    
    ```
    PointerAlignment: Left                 PointerAlignment: Right
    void* const* x = NULL;         vs.     void * const *x = NULL;
    
    ```
    
-   `SAPQ_After` (in configuration: `After`) Ensure that there is a space after pointer qualifiers.
    
    ```
    PointerAlignment: Left                 PointerAlignment: Right
    void* const * x = NULL;         vs.     void *const *x = NULL;
    
    ```
    
-   `SAPQ_Both` (in configuration: `Both`) Ensure that there is a space both before and after pointer qualifiers.
    
    ```
    PointerAlignment: Left                 PointerAlignment: Right
    void* const * x = NULL;         vs.     void * const *x = NULL;
    
    ```
    

__SpaceBeforeAssignmentOperators__ (`Boolean`) clang-format 3.7

If `false`, spaces will be removed before assignment operators.

```
true:                                  false:
int a = 5;                     vs.     int a= 5;
a += 42;                               a+= 42;

```

__SpaceBeforeCaseColon__ (`Boolean`) clang-format 12

If `false`, spaces will be removed before case colon.

```
true:                                   false
switch (x) {                    vs.     switch (x) {
  case 1 : break;                         case 1: break;
}                                       }

```

__SpaceBeforeCpp11BracedList__ (`Boolean`) clang-format 7

If `true`, a space will be inserted before a C++11 braced list used to initialize an object (after the preceding identifier or type).

```
true:                                  false:
Foo foo { bar };               vs.     Foo foo{ bar };
Foo {};                                Foo{};
vector<int> { 1, 2, 3 };               vector<int>{ 1, 2, 3 };
new int[3] { 1, 2, 3 };                new int[3]{ 1, 2, 3 };

```

__SpaceBeforeCtorInitializerColon__ (`Boolean`) clang-format 7

If `false`, spaces will be removed before constructor initializer colon.

```
true:                                  false:
Foo::Foo() : a(a) {}                   Foo::Foo(): a(a) {}

```

__SpaceBeforeInheritanceColon__ (`Boolean`) clang-format 7

If `false`, spaces will be removed before inheritance colon.

```
true:                                  false:
class Foo : Bar {}             vs.     class Foo: Bar {}

```

__SpaceBeforeParens__ (`SpaceBeforeParensStyle`) clang-format 3.5

Defines in which cases to put a space before opening parentheses.

Possible values:

-   `SBPO_Never` (in configuration: `Never`) Never put a space before opening parentheses.
    
    ```
    void f() {
      if(true) {
        f();
      }
    }
    
    ```
    
-   `SBPO_ControlStatements` (in configuration: `ControlStatements`) Put a space before opening parentheses only after control statement keywords (`for/if/while...`).
    
    ```
    void f() {
      if (true) {
        f();
      }
    }
    
    ```
    
-   `SBPO_ControlStatementsExceptControlMacros` (in configuration: `ControlStatementsExceptControlMacros`) Same as `SBPO_ControlStatements` except this option doesn’t apply to ForEach and If macros. This is useful in projects where ForEach/If macros are treated as function calls instead of control statements. `SBPO_ControlStatementsExceptForEachMacros` remains an alias for backward compatibility.
    
    ```
    void f() {
      Q_FOREACH(...) {
        f();
      }
    }
    
    ```
    
-   `SBPO_NonEmptyParentheses` (in configuration: `NonEmptyParentheses`) Put a space before opening parentheses only if the parentheses are not empty i.e. ‘()’
    
    ```
    void() {
      if (true) {
        f();
        g (x, y, z);
      }
    }
    
    ```
    
-   `SBPO_Always` (in configuration: `Always`) Always put a space before opening parentheses, except when it’s prohibited by the syntax rules (in function-like macro definitions) or when determined by other style rules (after unary operators, opening parentheses, etc.)
    
    ```
    void f () {
      if (true) {
        f ();
      }
    }
    
    ```
    
-   `SBPO_Custom` (in configuration: `Custom`) Configure each individual space before parentheses in SpaceBeforeParensOptions.
    

__SpaceBeforeParensOptions__ (`SpaceBeforeParensCustom`) clang-format 14

Control of individual space before parentheses.

If `SpaceBeforeParens` is set to `Custom`, use this to specify how each individual space before parentheses case should be handled. Otherwise, this is ignored.

```
# Example of usage:
SpaceBeforeParens: Custom
SpaceBeforeParensOptions:
  AfterControlStatements: true
  AfterFunctionDefinitionName: true

```

Nested configuration flags:

Precise control over the spacing before parentheses.

```
# Should be declared this way:
SpaceBeforeParens: Custom
SpaceBeforeParensOptions:
  AfterControlStatements: true
  AfterFunctionDefinitionName: true

```

-   `bool AfterControlStatements` If `true`, put space betwee control statement keywords (for/if/while…) and opening parentheses.
    
    ```
    true:                                  false:
    if (...) {}                     vs.    if(...) {}
    
    ```
    
-   `bool AfterForeachMacros` If `true`, put space between foreach macros and opening parentheses.
    
    ```
    true:                                  false:
    FOREACH (...)                   vs.    FOREACH(...)
      <loop-body>                            <loop-body>
    
    ```
    
-   `bool AfterFunctionDeclarationName` If `true`, put a space between function declaration name and opening parentheses.
    
    ```
    true:                                  false:
    void f ();                      vs.    void f();
    
    ```
    
-   `bool AfterFunctionDefinitionName` If `true`, put a space between function definition name and opening parentheses.
    
    ```
    true:                                  false:
    void f () {}                    vs.    void f() {}
    
    ```
    
-   `bool AfterIfMacros` If `true`, put space between if macros and opening parentheses.
    
    ```
    true:                                  false:
    IF (...)                        vs.    IF(...)
      <conditional-body>                     <conditional-body>
    
    ```
    
-   `bool AfterOverloadedOperator` If `true`, put a space between operator overloading and opening parentheses.
    
    ```
    true:                                  false:
    void operator++ (int a);        vs.    void operator++(int a);
    object.operator++ (10);                object.operator++(10);
    
    ```
    
-   `bool AfterRequiresInClause` If `true`, put space between requires keyword in a requires clause and opening parentheses, if there is one.
    
    ```
    true:                                  false:
    template<typename T>            vs.    template<typename T>
    requires (A<T> && B<T>)                requires(A<T> && B<T>)
    ...                                    ...
    
    ```
    
-   `bool AfterRequiresInExpression` If `true`, put space between requires keyword in a requires expression and opening parentheses.
    
    ```
    true:                                  false:
    template<typename T>            vs.    template<typename T>
    concept C = requires (T t) {           concept C = requires(T t) {
                  ...                                    ...
                }                                      }
    
    ```
    
-   `bool BeforeNonEmptyParentheses` If `true`, put a space before opening parentheses only if the parentheses are not empty.
    
    ```
    true:                                  false:
    void f (int a);                 vs.    void f();
    f (a);                                 f();
    
    ```
    

__SpaceBeforeRangeBasedForLoopColon__ (`Boolean`) clang-format 7

If `false`, spaces will be removed before range-based for loop colon.

```
true:                                  false:
for (auto v : values) {}       vs.     for(auto v: values) {}

```

__SpaceBeforeSquareBrackets__ (`Boolean`) clang-format 10

If `true`, spaces will be before `[`. Lambdas will not be affected. Only the first `[` will get a space added.

```
true:                                  false:
int a [5];                    vs.      int a[5];
int a [5][5];                 vs.      int a[5][5];

```

__SpaceInEmptyBlock__ (`Boolean`) clang-format 10

If `true`, spaces will be inserted into `{}`.

```
true:                                false:
void f() { }                   vs.   void f() {}
while (true) { }                     while (true) {}

```

__SpaceInEmptyParentheses__ (`Boolean`) clang-format 3.7

If `true`, spaces may be inserted into `()`.

```
true:                                false:
void f( ) {                    vs.   void f() {
  int x[] = {foo( ), bar( )};          int x[] = {foo(), bar()};
  if (true) {                          if (true) {
    f( );                                f();
  }                                    }
}                                    }

```

__SpacesBeforeTrailingComments__ (`Unsigned`) clang-format 3.7

The number of spaces before trailing line comments (`//` - comments).

This does not affect trailing block comments (`/*` - comments) as those commonly have different usage patterns and a number of special cases.

```
SpacesBeforeTrailingComments: 3
void f() {
  if (true) {   // foo1
    f();        // bar
  }             // foo
}

```

__SpacesInAngles__ (`SpacesInAnglesStyle`) clang-format 3.4

The SpacesInAnglesStyle to use for template argument lists.

Possible values:

-   `SIAS_Never` (in configuration: `Never`) Remove spaces after `<` and before `>`.
    
    ```
    static_cast<int>(arg);
    std::function<void(int)> fct;
    
    ```
    
-   `SIAS_Always` (in configuration: `Always`) Add spaces after `<` and before `>`.
    
    ```
    static_cast< int >(arg);
    std::function< void(int) > fct;
    
    ```
    
-   `SIAS_Leave` (in configuration: `Leave`) Keep a single space after `<` and before `>` if any spaces were present. Option `Standard: Cpp03` takes precedence.
    

__SpacesInCStyleCastParentheses__ (`Boolean`) clang-format 3.7

If `true`, spaces may be inserted into C style casts.

```
true:                                  false:
x = ( int32 )y                 vs.     x = (int32)y

```

__SpacesInConditionalStatement__ (`Boolean`) clang-format 10

If `true`, spaces will be inserted around if/for/switch/while conditions.

```
true:                                  false:
if ( a )  { ... }              vs.     if (a) { ... }
while ( i < 5 )  { ... }               while (i < 5) { ... }

```

__SpacesInContainerLiterals__ (`Boolean`) clang-format 3.7

If `true`, spaces are inserted inside container literals (e.g. ObjC and Javascript array and dict literals).

```
true:                                  false:
var arr = [ 1, 2, 3 ];         vs.     var arr = [1, 2, 3];
f({a : 1, b : 2, c : 3});              f({a: 1, b: 2, c: 3});

```

__SpacesInLineCommentPrefix__ (`SpacesInLineComment`) clang-format 13

How many spaces are allowed at the start of a line comment. To disable the maximum set it to `-1`, apart from that the maximum takes precedence over the minimum.

```
Minimum = 1
Maximum = -1
// One space is forced

//  but more spaces are possible

Minimum = 0
Maximum = 0
//Forces to start every comment directly after the slashes

```

Note that in line comment sections the relative indent of the subsequent lines is kept, that means the following:

```
before:                                   after:
Minimum: 1
//if (b) {                                // if (b) {
//  return true;                          //   return true;
//}                                       // }

Maximum: 0
/// List:                                 ///List:
///  - Foo                                /// - Foo
///    - Bar                              ///   - Bar

```

This option has only effect if `ReflowComments` is set to `true`.

Nested configuration flags:

Control of spaces within a single line comment.

-   `unsigned Minimum` The minimum number of spaces at the start of the comment.
-   `unsigned Maximum` The maximum number of spaces at the start of the comment.

__SpacesInParentheses__ (`Boolean`) clang-format 3.7

If `true`, spaces will be inserted after `(` and before `)`.

```
true:                                  false:
t f( Deleted & ) & = delete;   vs.     t f(Deleted &) & = delete;

```

__SpacesInSquareBrackets__ (`Boolean`) clang-format 3.7

If `true`, spaces will be inserted after `[` and before `]`. Lambdas without arguments or unspecified size array declarations will not be affected.

```
true:                                  false:
int a[ 5 ];                    vs.     int a[5];
std::unique_ptr<int[]> foo() {} // Won't be affected

```

__Standard__ (`LanguageStandard`) clang-format 3.7

Parse and format C++ constructs compatible with this standard.

```
c++03:                                 latest:
vector<set<int> > x;           vs.     vector<set<int>> x;

```

Possible values:

-   `LS_Cpp03` (in configuration: `c++03`) Parse and format as C++03. `Cpp03` is a deprecated alias for `c++03`
-   `LS_Cpp11` (in configuration: `c++11`) Parse and format as C++11.
-   `LS_Cpp14` (in configuration: `c++14`) Parse and format as C++14.
-   `LS_Cpp17` (in configuration: `c++17`) Parse and format as C++17.
-   `LS_Cpp20` (in configuration: `c++20`) Parse and format as C++20.
-   `LS_Latest` (in configuration: `Latest`) Parse and format using the latest supported language version. `Cpp11` is a deprecated alias for `Latest`
-   `LS_Auto` (in configuration: `Auto`) Automatic detection based on the input.

__StatementAttributeLikeMacros__ (`List of Strings`) clang-format 12

Macros which are ignored in front of a statement, as if they were an attribute. So that they are not parsed as identifier, for example for Qts emit.

```
AlignConsecutiveDeclarations: true
StatementAttributeLikeMacros: []
unsigned char data = 'x';
emit          signal(data); // This is parsed as variable declaration.

AlignConsecutiveDeclarations: true
StatementAttributeLikeMacros: [emit]
unsigned char data = 'x';
emit signal(data); // Now it's fine again.

```

__StatementMacros__ (`List of Strings`) clang-format 8

A vector of macros that should be interpreted as complete statements.

Typical macros are expressions, and require a semi-colon to be added; sometimes this is not the case, and this allows to make clang-format aware of such cases.

For example: Q\_UNUSED

__TabWidth__ (`Unsigned`) clang-format 3.7

The number of columns used for tab stops.

__TypenameMacros__ (`List of Strings`) clang-format 9

A vector of macros that should be interpreted as type declarations instead of as function calls.

These are expected to be macros of the form:

In the .clang-format configuration file, this can be configured like:

```
TypenameMacros: ['STACK_OF', 'LIST']

```

For example: OpenSSL STACK\_OF, BSD LIST\_ENTRY.

__UseCRLF__ (`Boolean`) clang-format 10

Use `\r\n` instead of `\n` for line breaks. Also used as fallback if `DeriveLineEnding` is true.

__UseTab__ (`UseTabStyle`) clang-format 3.7

The way to use tab characters in the resulting file.

Possible values:

-   `UT_Never` (in configuration: `Never`) Never use tab.
-   `UT_ForIndentation` (in configuration: `ForIndentation`) Use tabs only for indentation.
-   `UT_ForContinuationAndIndentation` (in configuration: `ForContinuationAndIndentation`) Fill all leading whitespace with tabs, and use spaces for alignment that appears within a line (e.g. consecutive assignments and declarations).
-   `UT_AlignWithSpaces` (in configuration: `AlignWithSpaces`) Use tabs for line continuation and indentation, and spaces for alignment.
-   `UT_Always` (in configuration: `Always`) Use tabs whenever we need to fill whitespace that spans at least from one tab stop to the next one.

__WhitespaceSensitiveMacros__ (`List of Strings`) clang-format 11

A vector of macros which are whitespace-sensitive and should not be touched.

These are expected to be macros of the form:

In the .clang-format configuration file, this can be configured like:

```
WhitespaceSensitiveMacros: ['STRINGIZE', 'PP_STRINGIZE']

```

For example: BOOST\_PP\_STRINGIZE

[1]: https://llvm.org/docs/CodingStandards.html
[2]: https://google.github.io/styleguide/cppguide.html
[3]: https://chromium.googlesource.com/chromium/src/+/refs/heads/main/styleguide/styleguide.md
[4]: https://firefox-source-docs.mozilla.org/code-quality/coding-style/index.html
[5]: https://www.webkit.org/coding/coding-style.html
[6]: https://docs.microsoft.com/en-us/visualstudio/ide/editorconfig-code-style-settings-reference
[7]: https://www.gnu.org/prep/standards/standards.html
[8]: https://github.com/capnproto/capnproto/blob/master/kjdoc/tour.md#maybes
[9]: https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap09.html
[10]: https://llvm.org/docs/CodingStandards.html#include-style
[11]: https://github.com/capnproto/capnproto/blob/master/style-guide.md
[12]: https://developers.google.com/protocol-buffers/
[13]: https://developers.google.com/protocol-buffers/
[14]: https://standards.ieee.org/ieee/1800/6700/
[15]: https://sci-hub.st/10.1109/IEEESTD.2018.8299595
