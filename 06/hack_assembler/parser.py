import re
from constants import LABEL_REGEX
from constants import VARIABLE_REGEX

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
      
  