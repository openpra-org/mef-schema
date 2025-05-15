/**
 * @file fty_v7.g4
 * @brief ANTLR4 grammar for "Fault Tree Recovery Rules (Version 7)" .FTY files.
 *
 * This grammar parses .FTY files containing multiple recovery rule blocks, each with a header
 * (project name), a rule text line, and terminated by a ^EOS marker.
 *
 * Each block is of the form:
 *   project, ruletext =
 *   (EOL)
 *   ^EOS
 *   (EOL)
 * where:
 *   - project: 24-character Project name (may be shorter)
 *   - ruletext: free-form text (may be empty)
 *   - ^EOS: end-of-section marker, must be at start of line
 *   - EOL: end-of-line (CR, LF, or CRLF)
 */

grammar fty_v7;

// The root rule: a file is a sequence of recovery rule blocks, possibly with trailing whitespace or blank lines.
file_
    : (recoveryBlock (EOL)*)* EOF
    ;

// A recovery rule block: header line, ^EOS, and at least one EOL after ^EOS.
recoveryBlock
    : headerLine (EOL)+ eosLine
    ;

// Header line: project, ruletext =
headerLine
    : projectName COMMA ruleText EQUALS
    ;

// Project name: up to 24 characters, allow letters, digits, dashes, underscores, spaces.
projectName
    : NAME24
    ;

// Rule text: any characters except EOL and '=' (may be empty).
ruleText
    : RULETEXT
    ;

// End-of-section marker: ^EOS at start of line, followed by EOL(s)
eosLine
    : CARET_EOS (EOL)+
    ;

// -------------------- LEXER RULES --------------------

// Comma and equals
COMMA   : ',' ;
EQUALS  : '=' ;

// ^EOS marker (must be at start of line, so not preceded by any non-EOL)
CARET_EOS : '^EOS' ;

// 24-character name: any characters except comma, EOL, or '=' (may be empty)
NAME24
    : ( ~[,\r\n=] )*
    ;

// Rule text: any characters except EOL or '=' (may be empty)
RULETEXT
    : ( ~[\r\n=] )*
    ;

// End of line: CR, LF, or CRLF
EOL
    : '\r\n' | '\n' | '\r'
    ;

// Whitespace (spaces/tabs) between tokens, skip
WS
    : [ \t]+ -> skip
    ;
