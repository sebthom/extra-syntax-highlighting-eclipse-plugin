// SyntaxHighlightTest.ql
// Compact showcase for CodeQL syntax & keywords.

/**
 * Doc comment with tags:
 * @name Syntax highlight test
 * @id syntax-highlight-test
 */

import javascript
import semmle.code.java.Expressions as JExprs;

module SyntaxHighlightTest {

  /* ---- Types, newtype, literals, operators, booleans ---- */

  newtype SmallInt = int

  private cached predicate literalsAndOps(int i, float f, string s, boolean b) {
    // numeric + boolean + string + escapes + arithmetic + logic
    i = 0 or i = -42 and
    f = 3.14 or f = -0.0 and
    b = true and not false and
    s = "Hello\nWorld\t\"" + "\\" and
    i = 1 + 2 * 3 / 4 % 2
  }

  /* ---- Classes, abstract, extends, instanceof, casts, regex ---- */

  abstract class MyNode extends Expr {
    MyNode() {
      this instanceof CallExpr
      or this = this.(Expr) // cast expression
    }
  }

  class MyConcreteNode extends MyNode {
    MyConcreteNode() {
      exists(MyNode n |
        n = this.getAChild*() and
        n.toString().matches("%test%") and
        n.toString().regexpMatch(".*test.*")
      )
    }

    predicate hasIndexInRange(int idx) {
      idx in [0 .. 9]
    }
  }

  /* ---- Quantifiers, aggregates, if-then-else expression ---- */

  private predicate quantify(MyConcreteNode n, int total) {
    exists(int i |
      i in [1 .. 10] and
      forall(int j | j = i implies j >= 1 and j <= 10)
    ) and
    total =
      count(MyConcreteNode m | m = n) +
      max(int k | k in [0 .. 5]) -
      min(int k | k in [0 .. 5])
  }

  int exampleIfExpr() {
    result = if 1 < 2 then 1 else 0
  }

  /* ---- Main query: from / where / select / order / limit ---- */

  from MyConcreteNode n, int calls, string label
  where
    literalsAndOps(_, _, _, _) and
    quantify(n, calls) and
    label = "calls: " + calls.toString()
  select n, calls, label
  order by calls desc, n
  limit 20
}
