= Typst Cheatsheet

This is a quick reference for common Typst features.

// --- Text styling ---
*Bold*  
_Italic_  
`Monospace`  
~Subscript~ and ^Superscript^  
[Link](https://typst.app)  
#highlight[Highlight]  

// --- Headings ---
= Heading 1
== Heading 2
=== Heading 3

// --- Lists ---
- Bullet item
- Another bullet
  - Nested item

+ Numbered list
+ Another item
  + Nested item

// --- Math mode ---
Let’s write inline math: $a^2 + b^2 = c^2$  
Or a display equation:


$
integral_0^1 x^2 d x = 1/3
$

// --- Tables ---
#table(
  columns: (1fr, 2fr, 1fr),
  [ID], [Name], [Score],
  [1], [Alice], [92],
  [2], [Bob], [85]
)

$x dot y$

#calc.max(3, 2*4)
