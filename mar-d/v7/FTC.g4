/**
 * @file ftc_v7.g4
 * @brief ANTLR4 grammar for "Fault Tree Cut Sets (Version 7)" .FTC files.
 *
 * This grammar parses .FTC files containing multiple cut set tables, each with a header,
 * a list of cut set expressions (possibly spanning multiple lines), and terminated by a ^EOS marker.
 *
 * - Lines beginning with '*' are comments and ignored.
 * - Each table header is of the form: project, fault tree, analysis (EOL) = (EOL)
 * - Each cut set expression may span multiple lines, ending with a period ('.').
 * - Cut sets are separated by '+', events by '*'.
 * - Event names are up to 24 characters, complemented events (with '/') are max 4 chars including '/'.
 * - Spaces and tabs are ignored.
 * - The table ends with a line containing only ^EOS.
 */

grammar ftc_v7;

// The root rule: a file is a sequence of cut set tables, possibly with comments or blank lines.
file_
    : (commentLine | tableBlock | blankLine)* EOF
    ;

// Comment lines: lines starting with '*', skip content to EOL.
commentLine
    : COMMENT_LINE
    ;

// Blank lines: just EOL (not part of a table)
blankLine
    : EOL
    ;

// A table block: header, '=', cut set expressions, ^EOS, and at least one EOL after ^EOS.
tableBlock
    : tableHeader EOL EQUALS EOL cutSetExprBlock eosLine
    ;

// Table header: project, fault tree, analysis
tableHeader
    : projectName COMMA faultTreeName COMMA analysisType
    ;

// Project and fault tree names: up to 24 characters, not empty, not including ',', '=', or EOL
projectName
    : NAME24
    ;

faultTreeName
    : NAME24
    ;

// Analysis type: any non-EOL, non-comma, non-equals, non-space, non-tab, at least one char
analysisType
    : ANALYSIS_TYPE
    ;

// End-of-section marker: ^EOS at start of line, followed by EOL(s)
eosLine
    : CARET_EOS EOL+
    ;

// Block of cut set expressions: one or more cut set expressions, each ending with a period ('.')
cutSetExprBlock
    : (cutSetExpr)+
    ;

// A cut set expression: one or more lines, concatenated until a period ('.') is found
cutSetExpr
    : cutSetExprLine+ PERIOD EOL
    ;

// A cut set expression line: one or more cut sets separated by '+', possibly ending with '+', and EOL
cutSetExprLine
    : cutSet (PLUS cutSet)* (PLUS)? EOL
    ;

// A cut set: one or more events separated by '*'
cutSet
    : eventName (ASTERISK eventName)*
    ;

// Event name: either a complemented event (max 4 chars, starts with '/') or a normal event (up to 24 chars)
eventName
    : COMPLEMENTED_EVENT
    | EVENTNAME
    ;

// -------------------- LEXER RULES --------------------

// Comment line: starts with '*', consumes to EOL (including the EOL)
COMMENT_LINE
    : '*' ~[\r\n]* EOL -> skip
    ;

// Comma, equals, plus, asterisk, period
COMMA   : ',' ;
EQUALS  : '=' ;
PLUS    : '+' ;
ASTERISK: '*' ;
PERIOD  : '.' ;

// ^EOS marker (must be at start of line, so not preceded by any non-EOL)
CARET_EOS : '^EOS' ;

// 24-character name: at least 1 character, not including ',', '=', or EOL
NAME24
    : ( ~[,\r\n=] )+
    ;

// Analysis type: any non-EOL, non-comma, non-equals, non-space, non-tab, at least one char
ANALYSIS_TYPE
    : ( ~[=,\r\n \t] )+
    ;

// Complemented event: '/' followed by up to 3 non-separator chars (max 4 chars including '/')
COMPLEMENTED_EVENT
    : '/' ( ~[+*., \t\r\n] ){1,3}
    ;

// Event name: up to 24 chars, not including '+', '*', '.', ',', space, tab, or EOL
EVENTNAME
    : ( ~[+*., \t\r\n] ){1,24}
    ;

// End of line: CR, LF, or CRLF
EOL
    : '\r\n' | '\n' | '\r'
    ;

// Whitespace (spaces/tabs) between tokens, skip
WS
    : [ \t]+ -> skip
    ;
