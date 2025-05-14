/**
 * @file sqd_v7.g4
 * @brief ANTLR4 grammar for "Sequence Names and Descriptions (Version 7)" .SQD files.
 *
 * This grammar parses .SQD files containing multiple sequence tables, each with a header,
 * a list of sequence records, and terminated by a ^EOS marker.
 * 
 * Each table header is of the form:
 *   project,eventree =
 * where project and eventree are 24-character names (padded or not).
 * 
 * Each sequence record is of the form:
 *   name,description[,A]
 * where:
 *   - name: 24-character sequence name (may be shorter)
 *   - description: 120-character sequence description (may be shorter)
 *   - A: optional, 1 character, indicates alternate description
 * 
 * Fields are separated by commas. Empty fields are allowed.
 * 
 * The table ends with a line containing only ^EOS.
 */

grammar sqd_v7;

// The root rule: a file is a sequence of tables, possibly with trailing whitespace or blank lines.
file_
    : (table (EOL)*)* EOF
    ;

// A table: header, records, ^EOS, and at least one EOL after ^EOS.
table
    : tableHeader (EOL)+ sequenceRecord* eosLine
    ;

// Table header: project,eventree =
tableHeader
    : projectName COMMA eventreeName EQUALS
    ;

// Project and eventree names: up to 24 characters, allow letters, digits, dashes, underscores, spaces.
projectName
    : NAME24
    ;

eventreeName
    : NAME24
    ;

// End-of-section marker: ^EOS at start of line, followed by EOL(s)
eosLine
    : CARET_EOS (EOL)+
    ;

// A sequence record: name,description[,A] (A is optional, empty fields allowed)
sequenceRecord
    : seqName COMMA seqDescription (COMMA altFlag)? (EOL)+
    ;

// Sequence name: up to 24 chars, allow letters, digits, dashes, underscores, spaces.
seqName
    : NAME24
    ;

// Sequence description: up to 120 chars, allow anything except comma or EOL.
seqDescription
    : DESC120
    ;

// Optional alternate flag: a single character (A), or empty.
altFlag
    : ALTCHAR?
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

// 120-character description: anything except comma or EOL
DESC120
    : ( ~[,\r\n] )*
    ;

// Alternate flag: a single character (A), or empty
ALTCHAR
    : . // any single character (will be parsed as optional)
    ;

// End of line: CR, LF, or CRLF
EOL
    : '\r\n' | '\n' | '\r'
    ;

// Whitespace (spaces/tabs) between tokens, skip
WS
    : [ \t]+ -> skip
    ;
