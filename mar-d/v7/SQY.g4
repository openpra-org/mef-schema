/**
 * @file sqy_v7.g4
 * @brief ANTLR4 grammar for "Sequence Recovery Rules (Version 7)" .SQY files.
 *
 * This grammar parses .SQY files containing multiple sequence recovery rule blocks, each with a header
 * (project, event tree, sequence), a rule text line, and terminated by a ^EOS marker.
 *
 * Each block is of the form:
 *   project, eventtree, sequence =
 *   (EOL)
 *   ^EOS
 *   (EOL)
 * where:
 *   - project: 24-character Project name (may be shorter)
 *   - eventtree: 24-character Event tree name (may be shorter)
 *   - sequence: 24-character Sequence name (may be shorter)
 *   - ruletext: free-form text (may be empty)
 *   - ^EOS: end-of-section marker, must be at start of line
 *   - EOL: end-of-line (CR, LF, or CRLF)
 */

grammar sqy_v7;

// The root rule: a file is a sequence of sequence recovery rule blocks, possibly with trailing whitespace or blank lines.
file_
    : (recoveryBlock (EOL)*)* EOF
    ;

// A sequence recovery rule block: header line, ^EOS, and at least one EOL after ^EOS.
recoveryBlock
    : headerLine (EOL)+ eosLine
    ;

// Header line: project, eventtree, sequence =
headerLine
    : projectName COMMA eventTreeName COMMA sequenceName EQUALS
    ;

// Project name: up to 24 characters, allow letters, digits, dashes, underscores, spaces.
projectName
    : NAME24
    ;

// Event tree name: up to 24 characters, allow letters, digits, dashes, underscores, spaces.
eventTreeName
    : NAME24
    ;

// Sequence name: up to 24 characters, allow letters, digits, dashes, underscores, spaces.
sequenceName
    : NAME24
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

// End of line: CR, LF, or CRLF
EOL
    : '\r\n' | '\n' | '\r'
    ;

// Whitespace (spaces/tabs) between tokens, skip
WS
    : [ \t]+ -> skip
    ;
