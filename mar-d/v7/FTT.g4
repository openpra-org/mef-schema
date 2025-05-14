/**
 * @file ftt_v7.g4
 * @brief ANTLR4 grammar for "Fault Tree Textual Information (Version 7)" .FTT files.
 *
 * This grammar parses .FTT files containing multiple text blocks, each with a header,
 * optional alternate flag, a block of text (possibly empty), and terminated by a ^EOS marker.
 *
 * Each block header is of the form:
 *   project, fault tree [,A]=
 * where project and fault tree are 24-character names (padded or not).
 * The optional A field is a single character, indicating alternate text.
 *
 * The block text is any lines (including empty), up to the ^EOS marker.
 *
 * The block ends with a line containing only ^EOS.
 */

grammar ftt_v7;

// The root rule: a file is a sequence of text blocks, possibly with trailing whitespace or blank lines.
file_
    : (textBlock (EOL)*)* EOF
    ;

// A text block: header, text lines, ^EOS, and at least one EOL after ^EOS.
textBlock
    : blockHeader (EOL)+ blockText eosLine
    ;

// Block header: project,faulttree[,A]=
blockHeader
    : projectName COMMA faultTreeName (COMMA altFlag)? EQUALS
    ;

// Project and fault tree names: up to 24 characters, allow letters, digits, dashes, underscores, spaces.
projectName
    : NAME24
    ;

faultTreeName
    : NAME24
    ;

// Optional alternate flag: a single character (A)
altFlag
    : ALTCHAR
    ;

// Block text: zero or more lines, up to ^EOS (not including ^EOS line).
blockText
    : (blockTextLine)*
    ;

// A block text line: any characters except EOL, then EOL.
blockTextLine
    : TEXTLINE EOL
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

// 24-character name: letters, digits, dashes, underscores, spaces, or empty
NAME24
    : ( ~[,\r\n=] )*
    ;

// Alternate flag: a single character (A)
ALTCHAR
    : . // any single character
    ;

// A line of text (any characters except EOL)
TEXTLINE
    : ~[\r\n]*
    ;

// End of line: CR, LF, or CRLF
EOL
    : '\r\n' | '\n' | '\r'
    ;

// Whitespace (spaces/tabs) between tokens, skip
WS
    : [ \t]+ -> skip
    ;
