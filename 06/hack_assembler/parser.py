import re
from constants import LABEL_REGEX
from constants import VARIABLE_REGEX
from constants import C_INSTRUCTION_REGEX
from constants import A_INSTRUCTION_REGEX

class Parser:
  def __init__(self):
    pass

  def is_label(self, line):
    label_chars = re.search(LABEL_REGEX, line)
    if label_chars and label_chars.group()[0] == '(':
      return True
    else:
      return False

  def label_value(self, line):
    label_chars = re.search(LABEL_REGEX, line)
    if label_chars:
      return label_chars.group()[1:-1]

  def is_variable(self, line):
    variable_chars = re.search(VARIABLE_REGEX, line)
    if variable_chars and variable_chars.group()[0] == '@':
      return True
    else:
      return False

  def variable_value(self, line):
    variable_chars = re.search(VARIABLE_REGEX, line)
    if variable_chars:
      return variable_chars.group()[1:]

  def command_type_and_value(self, line):
    a_instruction_chars = re.search(A_INSTRUCTION_REGEX, line)
    c_instruction_chars = re.search(C_INSTRUCTION_REGEX, line)

    # ToFix!
    # I think my regex for parsing out the A instructions in flawed for cases like LOOP_ball.bounce

    if a_instruction_chars and a_instruction_chars.group()[0] == '@':
      command_type = 'A'
      command_value = a_instruction_chars.group().strip()
    elif c_instruction_chars and c_instruction_chars.groups()[0][0] not in ['(', '/']:
      command_type = 'C'
      command_value = c_instruction_chars.groups()[0].strip()
    else:
      command_type  = 'Ignore'
      command_value = 'Noop'

    return command_type, command_value
      
  