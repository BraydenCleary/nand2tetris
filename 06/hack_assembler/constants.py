DEFAULT_SYMBOL_TABLE_ENTRIES = [
  ('R0', 0),
  ('SP', 0),
  ('R1', 1),
  ('LCL', 1),
  ('R2', 2),
  ('ARG', 2),
  ('R3', 3),
  ('THIS', 3),
  ('R4', 4),
  ('THAT', 4),
  ('R5', 5),
  ('R6', 6),
  ('R7', 7),
  ('R8', 8),
  ('R9', 9),
  ('R10', 10),
  ('R11', 11),
  ('R12', 12),
  ('R13', 13),
  ('R14', 14),
  ('R15', 15),
  ('SCREEN', 16384),
  ('KBD', 24576)
]

LABEL_REGEX = '\([A-Za-z_.0-9]+\)'

VARIABLE_REGEX = '@[a-z_]+'

C_INSTRUCTION_REGEX = '(\S+)(.*)(\/*)'

A_INSTRUCTION_REGEX = '@[0-9A-Za-z_]+'