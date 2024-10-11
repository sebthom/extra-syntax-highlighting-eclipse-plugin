// Define the grammar name
grammar SimpleLang;

// -------------------- Lexer Rules --------------------

// Keywords
IF      : 'if';
ELSE    : 'else';
WHILE   : 'while';
FUNCTION: 'function';
RETURN  : 'return';
VAR     : 'var';

// Operators
PLUS    : '+';
MINUS   : '-';
MULT    : '*';
DIV     : '/';
ASSIGN  : '=';
EQ      : '==';
NEQ     : '!=';
LT      : '<';
GT      : '>';
LEQ     : '<=';
GEQ     : '>=';
AND     : '&&';
OR      : '||';
NOT     : '!';

// Delimiters
LPAREN  : '(';
RPAREN  : ')';
LBRACE  : '{';
RBRACE  : '}';
COMMA   : ',';
SEMICOLON: ';';

// Literals
INT     : [0-9]+;
FLOAT   : [0-9]+ '.' [0-9]+;
STRING  : '"' (~["\r\n])* '"';

// Identifiers
ID      : [a-zA-Z_][a-zA-Z_0-9]*;

// Whitespace and Comments
WS      : [ \t\r\n]+ -> skip;
COMMENT : '//' ~[\r\n]* -> skip;

// -------------------- Parser Rules --------------------

program
    : statement* EOF
    ;

statement
    : variableDeclaration
    | functionDeclaration
    | ifStatement
    | whileStatement
    | expressionStatement
    | returnStatement
    ;

variableDeclaration
    : VAR ID (ASSIGN expression)? SEMICOLON
    ;

functionDeclaration
    : FUNCTION ID LPAREN parameterList? RPAREN block
    ;

parameterList
    : ID (COMMA ID)*
    ;

block
    : LBRACE statement* RBRACE
    ;

ifStatement
    : IF LPAREN expression RPAREN block (ELSE block)?
    ;

whileStatement
    : WHILE LPAREN expression RPAREN block
    ;

returnStatement
    : RETURN expression? SEMICOLON
    ;

expressionStatement
    : expression SEMICOLON
    ;

expression
    : assignment
    ;

assignment
    : logicalOr (ASSIGN assignment)?
    ;

logicalOr
    : logicalAnd (OR logicalAnd)*
    ;

logicalAnd
    : equality (AND equality)*
    ;

equality
    : relational ((EQ | NEQ) relational)*
    ;

relational
    : additive ((LT | GT | LEQ | GEQ) additive)*
    ;

additive
    : multiplicative ((PLUS | MINUS) multiplicative)*
    ;

multiplicative
    : unary ((MULT | DIV) unary)*
    ;

unary
    : (NOT | MINUS) unary
    | primary
    ;

primary
    : INT
    | FLOAT
    | STRING
    | ID
    | functionCall
    | LPAREN expression RPAREN
    ;

functionCall
    : ID LPAREN argumentList? RPAREN
    ;

argumentList
    : expression (COMMA expression)*
    ;
