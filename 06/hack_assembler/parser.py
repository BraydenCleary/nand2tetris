class Parser:
  def __init__(self, symbol_table):
    self.symbol_table = symbol_table

  def is_label(self, line):
    if line[0] == '(':
      return True
    else:
      return False

  def label_value(self, line):
    return line[1:-1]

  def is_variable(self, line):
    if line[0] == '@' and not unicode(line[1]).isnumeric():
      return True
    else:
      return False

  def variable_value(self, line):
    return line[1:]

  def command_type_and_value(self, line):
    if line[0] == '@':
      command_type  = 'A'
      command_value = line[1:]
    elif line[0]  != '(':
      command_type  = 'C'
      command_value = line
    else:
      command_type  = 'Ignore'
      command_value = 'Noop'

    return command_type, command_value

  def get_c_instruction_parts(self, line):
    split_on_equals = line.split('=')
    if len(split_on_equals) == 2:
      dest = split_on_equals[0].strip()
      comp = split_on_equals[1].split(';')[0].strip()
    else:
      dest = None
      comp = split_on_equals[0].split(';')[0].strip()

    split_on_semicolon = line.split(';')
    if len(split_on_semicolon) == 2:
      jump = split_on_semicolon[1].strip()
    else:
      jump = None
      
    return dest, comp, jump

  def get_a_instruction_address_value(self, line):
    if unicode(line[0]).isnumeric():
      address_value = int(line[0:])
    else:
      address_value = int(self.symbol_table.get_address(line[0:]))

    return address_value