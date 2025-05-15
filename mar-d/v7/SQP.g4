/**
 * @file sqp_v7.g4
 * @brief ANTLR4 grammar for "Sequence Partition Rules (Version 7)" .SQP files.
 *
 * This grammar parses .SQP files containing multiple sequence partition rule blocks, each with a header
 * (project, event tree, sequence), optional partition rule text (may be empty), and terminated by a ^EOS marker.
 *
 * Each block is of the form:
 *   project, eventtree, sequence =
 *   [partition rule text lines...]
 *   ^EOS
 *   (EOL)
 * where:
 *   - project: 24-character Project name (may be shorter)
 *   - eventtree: 24-character Event tree name (may be shorter)
 *   - sequence: 24-character Sequence name (may be shorter)
 *   - partition rule text: zero or more lines of free-form text (may be empty)
 *   - ^EOS: end-of-section marker, must be at start of line
 *   - EOL: end-of-line (CR, LF, or CRLF)
 */

grammar sqp_v7;

// The root rule: a file is a sequence of partition rule blocks, possibly with trailing whitespace or blank lines.
file_
    : (partitionBlock (EOL)*)* EOF
    ;

// A partition rule block: header line, zero or more rule text lines, ^EOS, and at least one EOL after ^EOS.
partitionBlock
    : headerLine (EOL)+ partitionRuleText* eosLine
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

// Partition rule text: any line not starting with ^EOS, up to EOL.
partitionRuleText
    : PARTITION_TEXTLINE EOL
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

// Partition rule text line: any characters except EOL, but not a line that is exactly ^EOS
PARTITION_TEXTLINE
    : ~[\r\n]*
      {
        // This semantic predicate ensures that a line consisting only of "^EOS" is not matched as PARTITION_TEXTLINE.
        // This is necessary to prevent the accidental consumption of the ^EOS marker as rule text.
        getText().trim() != "^EOS"
      }?
    ;

// End of line: CR, LF, or CRLF
EOL
    : '\r\n' | '\n' | '\r'
    ;

// Whitespace (spaces/tabs) between tokens, skip
WS
    : [ \t]+ -> skip
    ;
