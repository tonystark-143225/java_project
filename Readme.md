# 🐍 Python Language Fundamentals

## 📘 Introduction
- **Python** is a **general-purpose, high-level programming language**.  
- Developed by **Guido van Rossum** in **1989** at the **National Research Institute, Netherlands**.  
- **Official Release:** 1991  
- **Official Birthday:** **February 20, 1991**  
- Recommended as the **first programming language for beginners** due to its simplicity, readability, and versatility.

---

### 💡 Summary
| Attribute | Details |
|-----------|---------|
| **Developer** | Guido van Rossum |
| **Year of Development** | 1989 |
| **Official Release** | 1991 |
| **Official Birthday** | February 20, 1991 |
| **Design Goal** | Simplicity and readability |
| **Recommended for** | Beginners and professionals |

---

> 🧠 **Fun Fact:**  
> Guido van Rossum named Python after the BBC comedy show *“Monty Python’s Flying Circus”*, not the snake!

---

## 🌍 Applications of Python
Python is general-purpose and widely used in:

- 🖥️ Desktop Applications  
- 🌐 Web Applications  
- 🗄️ Database Applications  
- 🌐 Network Programming  
- 🎮 Game Development  
- 📊 Data Analysis  
- 🤖 Machine Learning  
- 🧠 Artificial Intelligence  
- 🔗 Internet of Things (IoT)

---

# **Features of Python**

## 1️⃣ Simple and Easy to Learn
- Python code reads like **English statements**.  
- Has only **30+ keywords** and very simple syntax.  
- Enables writing **fewer lines of code**, improving readability and reducing development time and cost.

---

## 2️⃣ Freeware and Open Source
- Python is **free to use**, no license required.  
- **Open source**, allowing customization.  

**Example:** `Jython` — a Python version for Java applications.

---

## 3️⃣ High-Level Programming Language
- **Programmer-friendly**: No need to manage low-level tasks like memory or security.

---

## 4️⃣ Platform Independent
- Python programs run on any platform **without modification**.  
- The **Python Virtual Machine (PVM)** handles machine-level translation.

---

## 5️⃣ Portability
- Python programs are easily **migratable across platforms** (Linux, Windows, etc.)  
- Results remain **consistent on all platforms**.

---

## 6️⃣ Dynamically Typed
- Variable types are **determined at runtime**, no need to declare explicitly.  
- More flexible than **statically typed languages** like Java or C.

---

## 7️⃣ Procedure-Oriented & Object-Oriented
- Supports both **POP (C, Pascal)** and **OOP (C++, Java)**.  
- Combines benefits like **reusability** and **security**.

---

## 8️⃣ Interpreted
- Python is **interpreted**, no explicit compilation needed.  
- Interpreter raises syntax errors, and **PVM executes the code** after compilation.

---

## 9️⃣ Extensible
- Can integrate **other languages** into Python.  

**Advantages:**  
1. Reuse **existing non-Python code**  
2. **Improve performance** of applications

---

## 🔟 Embedded
- Python can be **embedded in other languages**, making it versatile.

---

## 11️⃣ Extensive Library
- Python comes with a **rich standard library**.  
- Pre-built modules save time and reduce redundant coding.

---

# **Limitations of Python**
1. **Performance** is slower because it is interpreted.  
2. **Not ideal for mobile applications**.


# **Flavors of Python**
| Flavor | Description |
|:-------|:------------|
| **CPython** | Standard implementation; works with C applications |
| **Jython (JPython)** | For Java applications; runs on **JVM** |
| **IronPython** | For **C#/.NET** platform |
| **PyPy** | High-performance; uses **JIT compiler** |
| **RubyPython** | Integrates with **Ruby** platforms |
| **Anaconda Python** | Designed for **data science** and large-scale data processing |

# **Identifiers**
In Python, **a name used to identify** a variable, function, class, or module is called an **identifier**.

Example:
```python
a = 10 # a is identifier
```
## 📝 Rules for Defining Identifiers in Python
✅ 1. Allowed Characters

An identifier can only contain:

Alphabets (A–Z or a–z)

Digits (0–9)

Underscore _

❌ If you use any other symbol like $, you’ll get a SyntaxError.
```
cash = 10     # ✅ Valid
ca$h = 20     # ❌ Invalid (contains $)
```
🚫 2. Identifier Should Not Start with a Digit
```
123total  # ❌ Invalid
total123  # ✅ Valid
```
🔠 3. Case Sensitivity

Python is case-sensitive, meaning uppercase and lowercase letters are treated differently.
```
total = 10
TOTAL = 999

print(total)  # Output: 10
print(TOTAL)  # Output: 999
```
🧱 4. Identifier Starting with Underscore

_variable → indicates private identifier

__variable → indicates strongly private identifier

__variable__ → special Python-defined identifiers (called magic methods)

Example:
```
__add__   # Built-in magic method name
```

⚙️ 5. Identifiers Cannot Be Reserved Words

Reserved words (keywords) are predefined in Python and cannot be used as identifiers.

Example:
```
def = 10  # ❌ Invalid, 'def' is a keyword
```
🧮 6. Length of Identifiers

There is no length limit for identifiers,but avoid overly long names for readability.

💲 7. Dollar Symbol Not Allowed

$ is not allowed in Python identifiers.


| Identifier   | Validity | Explanation            |
| ------------ | -------- | ---------------------- |
| `123total`   | ❌        | Starts with a digit    |
| `total123`   | ✅        | Valid identifier       |
| `java2share` | ✅        | Valid identifier       |
| `ca$h`       | ❌        | Contains `$` symbol    |
| `_abc_abc_`  | ✅        | Valid, starts with `_` |
| `def`        | ❌        | Reserved word          |
| `if`         | ❌        | Reserved word          |

### 💡 Notes on Underscore Usage

_name → Private variable

__name → Strongly private variable

__name__ → Magic methods or language-defined names (e.g., __init__, __add__, __str__)

🧱 Reserved Words in Python

Some words in Python have special meanings and are reserved.
There are 33 reserved words in total.

| Type                     | Keywords                                           |
|---------------------------|----------------------------------------------------|
| **Boolean & Constants**   | `True`, `False`, `None`                            |
| **Logical Operators**     | `and`, `or`, `not`, `is`                           |
| **Conditional**           | `if`, `elif`, `else`                               |
| **Loops & Control Flow**  | `while`, `for`, `break`, `continue`, `return`, `in`, `yield` |
| **Exception Handling**    | `try`, `except`, `finally`, `raise`, `assert`      |
| **Modules & Functions**   | `import`, `from`, `as`, `def`, `class`, `pass`     |
| **Scope & Variables**     | `global`, `nonlocal`                               |
| **Functional Programming**| `lambda`                                           |
| **Miscellaneous**         | `del`, `with`                                      |


⚠️ Notes

All reserved words contain only alphabet symbols.

Only True, False, and None start with a capital letter — all others are lowercase.

Example:
```
a = true   # ❌ Invalid
a = True   # ✅ Valid
```

💻 Checking Reserved Words in Python

You can use the keyword module to view all reserved words:
```
import keyword
print(keyword.kwlist)
```
ouput:
```
['False', 'None', 'True', 'and', 'as', 'assert', 'break', 'class', 'continue', 'def',
 'del', 'elif', 'else', 'except', 'finally', 'for', 'from', 'global', 'if', 'import',
 'in', 'is', 'lambda', 'nonlocal', 'not', 'or', 'pass', 'raise', 'return', 'try',
 'while', 'with', 'yield']
```

## DataTypes:

Data Type represent the type of data present inside a variable. 
In Python we are not required to specify the type explicitly. Based on value provided,the 
type will be assigned automatically.Hence Python is Dynamically Typed Language. 
 
Python contains the following inbuilt data types 
1. int 
2. float 
3. complex 
4. bool 
5. str 
6. bytes 
7. bytearray 
8. range 
9. list 
10. tuple 
11. set 
12. frozenset 
13. dict 
14. None

**Note:** Python contains several inbuilt functions 
 
1. type()

    to check the type of variable 
 
2. id() 

   to get address of object 

3. print()

      to print the value 

***In Python everything is object***

The most common (fundamental) data types are:

- `int`
- `float`
- `complex`
- `bool`
- `str`
---

## 🔢 `int` (Integer) Data Type

We can use the **`int`** data type to represent **whole numbers** (integers).

**Example:**
```python
a = 10
print(type(a))  # <class 'int'>
```
🧠 Note

In Python 2, there were two types: int and long.

In Python 3, long type was removed — now all integers are of type int, regardless of size.

⚙️ Representation of Integers

We can represent integers in four number systems:

| Number System | Base | Prefix       | Example      | Allowed Digits  |
| ------------- | ---- | ------------ | ------------ | --------------- |
| Decimal       | 10   | None         | `a = 10`     | 0–9             |
| Binary        | 2    | `0b` or `0B` | `a = 0b1111` | 0, 1            |
| Octal         | 8    | `0o` or `0O` | `a = 0o123`  | 0–7             |
| Hexadecimal   | 16   | `0x` or `0X` | `a = 0xFACE` | 0–9, a–f or A–F |

```
a = 10        # Decimal
b = 0b10      # Binary
c = 0o10      # Octal
d = 0x10      # Hexadecimal

print(a)  # 10
print(b)  # 2
print(c)  # 8
print(d)  # 16
```
🧠 Note: The Python Virtual Machine (PVM) always displays numbers in decimal form, even if you define them in binary, octal, or hex.

🔄 Base Conversion Functions

Python provides three built-in functions to convert between bases:
| Function | Description            | Example    | Output     |
| -------- | ---------------------- | ---------- | ---------- |
| `bin()`  | Convert to binary      | `bin(15)`  | `'0b1111'` |
| `oct()`  | Convert to octal       | `oct(10)`  | `'0o12'`   |
| `hex()`  | Convert to hexadecimal | `hex(100)` | `'0x64'`   |

🧮 Examples
```
print(bin(15))       # 0b1111
print(bin(0o11))     # 0b1001
print(bin(0x10))     # 0b10000

print(oct(10))       # 0o12
print(oct(0b1111))   # 0o17
print(oct(0x123))    # 0o443

print(hex(100))      # 0x64
print(hex(0b111111)) # 0x3f
print(hex(0o12345))  # 0x14e5
```

💧 float (Floating Point) Data Type

We use float to represent decimal (fractional) numbers.

Example:
```
f = 1.234
print(type(f))  # <class 'float'>
```
⚙️ Exponential (Scientific) Notation

You can represent large or small floating-point numbers using exponential form:
```
f = 1.2e3
print(f)  # 1200.0
```
Here, e or E represents 10 to the power of.

1.2e3 → 1.2 × 10³ = 1200.0

✅ Advantage: Saves memory and makes large numbers readable.

❌ Invalid Float Representations

Unlike integers, floats can only be written in decimal form.
```
f = 0b11.01    # ❌ SyntaxError
f = 0o123.456  # ❌ SyntaxError
f = 0x123.456  # ❌ SyntaxError
```
🧮 complex (Complex Number) Data Type

A complex number is of the form:
```
a + bj

Where:
a → Real part
b → Imaginary part
j → Represents √(-1)
```

⚙️ Integer & Float in Complex Numbers

The real part can be int (decimal, binary, octal, hex).

The imaginary part must be in decimal form only.
```
a = 0b11 + 5j     # ✅ Valid (real part is binary)
a = 3 + 0b11j     # ❌ Invalid (imaginary part must be decimal)
```
➕ Operations on Complex Numbers
```
a = 10 + 1.5j
b = 20 + 2.5j
c = a + b
print(c)          # (30+4j)
print(type(c))    # <class 'complex'>
```

📊 Complex Attributes

Each complex number has built-in attributes:
```
c = 10.5 + 3.6j

print(c.real)  # 10.5
print(c.imag)  # 3.6
```
🧠 Use Case: Scientific and Electrical Engineering Applications.

⚖️ bool (Boolean) Data Type

Represents True or False values.
```
b = True
print(type(b))  # <class 'bool'>

Internally:

True → 1
False → 0
```
```
a = 10
b = 20
c = a < b
print(c)  # True

print(True + True)   # 2
print(True - False)  # 1
```
🧵 str (String) Data Type

A string is a sequence of characters enclosed in quotes.

```
s1 = 'durga'
s2 = "durga"
```

✍️ Multi-line Strings

Use triple quotes for multi-line text:
```
s1 = '''durga
soft'''
s2 = """durga
soft"""
```
🧩 Including Quotes Inside Strings

You can include single/double quotes inside triple quotes:

```
s1 = '''This is "Python" class'''
s2 = "It's a great course!"
```
🔗 Embedding Strings
```
s = '''This "Python class" is very helpful for Java students'''
```
✂️ String Slicing

Slicing means extracting a portion (substring) of a string using the [] operator.

Indexing starts at 0 (left to right)

Negative indexing counts from right to left
```
s = "durga"
print(s[0])   # 'd'
print(s[1])   # 'u'
print(s[-1])  # 'a'
```
⚠️ Accessing an invalid index raises:
```
IndexError: string index out of range
```
🔍 Slice Examples
```
s = "durga"

print(s[1:4])   # 'urg'
print(s[1:])    # 'urga'
print(s[:4])    # 'durg'
print(s[:])     # 'durga'
print(s * 3)    # 'durgadurgadurga'
print(len(s))   # 5
```
| Data Type   | Description              | Example        |
| ----------- | ------------------------ | -------------- |
| **int**     | Whole numbers            | `a = 10`       |
| **float**   | Decimal numbers          | `f = 1.23`     |
| **complex** | Real + Imaginary numbers | `z = 3 + 5j`   |
| **bool**    | Logical values           | `b = True`     |
| **str**     | Sequence of characters   | `s = "Python"` |

🧾 Additional Notes

In Python, char type does not exist. A single character is simply a string of length 1.
```
c = 'a'
print(type(c))  # <class 'str'>
```

long type existed in Python 2, but in Python 3 all integers are just int.

Python is dynamically typed — you don’t need to declare data types explicitly.