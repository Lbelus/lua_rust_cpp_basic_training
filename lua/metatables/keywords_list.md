In Lua, metatables can define custom behavior for various operations on tables by using specific predefined metamethods. These metamethods are keys in the metatable, and each corresponds to a different type of operation. Here are the main keywords (metamethods) related to metatables:

### Basic Metamethods
1. **`__index`**:
   - Invoked when a key is not found in the table.
   - Can be a function or a table.

2. **`__newindex`**:
   - Invoked when trying to set a value to a key that doesn't exist in the table.

### Arithmetic Metamethods
3. **`__add`**:
   - Defines behavior for the addition operator (`+`).

4. **`__sub`**:
   - Defines behavior for the subtraction operator (`-`).

5. **`__mul`**:
   - Defines behavior for the multiplication operator (`*`).

6. **`__div`**:
   - Defines behavior for the division operator (`/`).

7. **`__mod`**:
   - Defines behavior for the modulo operator (`%`).

8. **`__pow`**:
   - Defines behavior for the exponentiation operator (`^`).

9. **`__unm`**:
   - Defines behavior for the unary minus operator (`-`).

### Relational Metamethods
10. **`__eq`**:
    - Defines behavior for the equality operator (`==`).

11. **`__lt`**:
    - Defines behavior for the less than operator (`<`).

12. **`__le`**:
    - Defines behavior for the less than or equal to operator (`<=`).

### Table Metamethods
13. **`__len`**:
    - Defines behavior for the length operator (`#`).

14. **`__concat`**:
    - Defines behavior for the concatenation operator (`..`).

### Function Metamethods
15. **`__call`**:
    - Invoked when the table is called like a function.

### String Metamethods
16. **`__tostring`**:
    - Defines behavior for converting the table to a string (typically used with `tostring()` or `print`).

### Miscellaneous Metamethods
17. **`__metatable`**:
    - Protects the metatable by controlling access to it. Setting this field makes the metatable immutable (prevents it from being changed or retrieved).