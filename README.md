XTemplate SE
============

Table of Contents
-----------------

*   [Introduction](#introduction)
*   [How It Works](#how-it-works)
*   [Installation](#installation)
*   [Basic Usage](#basic-usage)
*   [Template Syntax](#template-syntax)
*   [Blocks and Variables](#blocks-and-variables)
*   [Arithmetic Operations](#arithmetic-operations)
*   [Conditional Logic](#conditional-logic)
*   [Working with Loops](#working-with-loops)
*   [Callback Functions](#callback-functions)
*   [Error Handling](#error-handling)
*   [Performance Optimization](#performance-optimization)
*   [History](#history)
*   [License](#license)

Introduction
------------

`XTemplate SE` (Seditio Edition) is a modern and enhanced version of the classic `XTemplate` templating engine for PHP. Designed to separate application logic from presentation, it offers advanced features such as nested blocks, arithmetic operations, conditional logic, loops, and callback functions. It is suitable for both simple and complex projects where flexibility and performance are key.

How It Works
------------

`XTemplate SE` employs an object-oriented model for template processing, setting it apart from the older `XTemplate` class. The concept of this object-oriented approach was inspired by the `Cotemplate` templating engine from the [Cotonti](https://www.cotonti.com/) project, but it has been completely reworked and significantly improved for greater flexibility and performance.

*   **Object Structure**:
    *   Templates are broken down into objects: `XtplBlock` (blocks), `XtplVar` (variables), `XtplExpr` (expressions), `XtplData` (data), and `XtplLogical` (conditions).
    *   Each template element is represented as a class instance, enabling flexible parsing and rendering, unlike the linear processing of the old `XTemplate`.
*   **Expression Handling**:
    *   Arithmetic and logical operations are processed via `XtplExpr` using Reverse Polish Notation (RPN) for accurate evaluation with proper precedence and parentheses support.
    *   The old `XTemplate` relied on basic regex-based expression handling with limited functionality.
*   **Enhanced Tokenization**:
    *   Dynamic tokenization supports complex constructs (parentheses, operator precedence), replacing the static approach of the previous version.
*   **Advantages Over Old XTemplate**:
    *   **Extensibility**: Easy to add new operators and functions.
    *   **Reliability**: Built-in error handling (e.g., division by zero).
    *   **Performance**: Lazy evaluation of expressions and template structure caching.

Example: `{NUM1 + NUM2 * NUM3}` is converted to RPN (`NUM1 NUM2 NUM3 * +`), evaluated with precedence, and returns the correct result.

Installation
------------

1.  Download the `XTemplate.php` file from the repository.
2.  Include it in your project:
```    
        <?php
        require_once 'XTemplate.php';
 ```                   
    

No additional dependencies are required.

Basic Usage
-----------

Create a template, assign variables, and render the output:
```
    <?php
    require_once 'XTemplate.php';
    
    $xtpl = new XTemplate('template.tpl');
    $xtpl->assign('USERNAME', 'John Doe');
    $xtpl->parse('MAIN');
    $xtpl->out('MAIN');
```        

Template `template.tpl`:
```
    <!-- BEGIN: MAIN -->
    <h1>Hello, {USERNAME}!</h1>
    <!-- END: MAIN -->
```        

Output:
```
    <h1>Hello, John Doe!</h1>
 ```       

Template Syntax
---------------

*   **Variables**: `{VAR}` — Inserts the value of a variable.
*   **Blocks**: `<!-- BEGIN: BLOCK --> ... <!-- END: BLOCK -->` — Defines repeatable or conditional sections.
*   **Comments**: `<!-- ... -->` — Ignored during processing.

Blocks and Variables
--------------------

Blocks structure the template, while variables are substituted within them.

Example:
```
    <!-- BEGIN: MAIN -->
    <div>
        <p>Name: {USER.name}</p>
        <p>Score: {USER.score}</p>
    </div>
    <!-- END: MAIN -->
  ```      

PHP:
```
    $xtpl->assign('USER', ['name' => 'Alice', 'score' => 95]);
    $xtpl->parse('MAIN');
    $xtpl->out('MAIN');
```        

Output:
```
    <div>
        <p>Name: Alice</p>
        <p>Score: 95</p>
    </div>
```        

Arithmetic Operations
---------------------

Supported operations: `+`, `-`, `*`, `/`, `%`:
```
*   Numeric: `{NUM1 + NUM2}`, `{PRICE - DISCOUNT}`
*   String: `{STR1 + STR2}` (concatenation)
```
Example:
```
    <p>Total: {ITEM.price - ITEM.discount}</p>
```        

PHP:
```
    $xtpl->assign('ITEM', ['price' => 10, 'discount' => 2]);
 ```       

Output:
```
    <p>Total: 8</p>
 ```       

Conditional Logic
-----------------

Use `<!-- IF -->` for conditions:
```
*   Comparison operators: `==`, `===`, `!=`, `!==`, `<`, `>`, `<=`, `>=`
*   Logical operators: `AND`, `OR`, `XOR`, `!`
```
Example:
```
    <!-- IF {SCORE} > 80 -->
    <p>High score!</p>
    <!-- ELSE -->
    <p>Try harder.</p>
    <!-- ENDIF -->
```        

PHP:
```
    $xtpl->assign('SCORE', 85);
 ```       

Output:
```
    <p>High score!</p>
 ```       

Complex conditions with parentheses:
```
    <!-- IF ( {NUM1} > {NUM2} ) AND ( {NUM3} < {NUM4} ) -->
    <p>Complex condition met</p>
    <!-- ENDIF -->
```        

Working with Loops
------------------

Use nested blocks or `<!-- FOR -->` loops to iterate over arrays.

### Nested Blocks
  
   Example:
 ```  
   <!-- BEGIN: MAIN -->
   <ul>
       <!-- BEGIN: ITEMS -->
       <li>{ITEM.name} - ${ITEM.price}</li>
       <!-- END: ITEMS -->
   </ul>
   <!-- END: MAIN -->
```
PHP:
```
   $xtpl->assign('ITEMS', [
       ['name' => 'Book', 'price' => 15],
       ['name' => 'Pen', 'price' => 2]
   ]);
   $xtpl->parse('MAIN.ITEMS');
   $xtpl->parse('MAIN');
```
Output:
```
   <ul>
       <li>Book - $15</li>
       <li>Pen - $2</li>
   </ul>
```
### FOR Loops

   Use `<!-- FOR {VALUE} IN {ARRAY} -->` to iterate over array values, or `<!-- FOR {KEY}, {VALUE} IN {ARRAY} -->` to access both keys and values.

#### Values Only

Example:
  ``` 
   <!-- FOR {VALUE} IN {MY_ARRAY} -->
   <p>Item: {VALUE}</p>
   <!-- ENDFOR -->
```
PHP:
```
   $xtpl->assign('MY_ARRAY', ['Apple', 'Banana', 'Orange']);
   $xtpl->parse('MAIN');
```
Output:
```
   <p>Item: Apple</p>
   <p>Item: Banana</p>
   <p>Item: Orange</p>
```
#### Keys and Values

Example:
  ``` 
   <!-- FOR {KEY}, {VALUE} IN {MY_ARRAY} -->
   <p>{KEY}: {VALUE}</p>
   <!-- ENDFOR -->
```
PHP:
```
   $xtpl->assign('MY_ARRAY', ['a' => 'Apple', 'b' => 'Banana', 'c' => 'Orange']);
   $xtpl->parse('MAIN');
```
Output:
```
   <p>a: Apple</p>
   <p>b: Banana</p>
   <p>c: Orange</p>
 ```       

Callback Functions
------------------

Add modifiers using `|`:
```
*   `{VAR|func}` — Applies the function `func` to `VAR`.
*   `{VAR|func($this, arg)}` — Passes arguments.
```
Example:
```
    <p>Last login: {LAST_LOGIN|strtotime|date('Y-m-d', $this)}</p>
```        

PHP:
```
    $xtpl->assign('LAST_LOGIN', '2025-03-07 12:00:00');
 ```       

Output:
```
    <p>Last login: 2025-03-07</p>
  ```      

Error Handling
--------------

Division by zero (`/`, `%`) returns messages: `"Division by zero"`, `"Modulo by zero"`. Unknown operators throw an `"Unknown operator"` exception.

Example:
```
    <p>{NUM / ZERO}</p>
```        

Output:
```
    <p>Division by zero</p>
```        

For comprehensive error handling, add a `try-catch` block in `XtplVar::evaluate()`.

Performance Optimization
------------------------

*   **Caching**: Templates are parsed once and stored in memory.
*   **Lazy Loading**: Variables are evaluated only when `parse()` is called.
*   **Tip**: Minimize nested blocks and complex expressions for large datasets.

History
-------

*   **v1.0 (2025-03-07)**: Initial release with support for blocks, variables, arithmetic, conditions, and loops.
*   **v1.1**: Fixed `%` operator support and improved error handling.

License
-------

The project is licensed under the [BSD 3-Clause License](LICENSE). You are free to use, modify, and distribute the code provided the license terms are followed.
