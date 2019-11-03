class BinaryTraslator:
  def __init__(self, symbol_table):
    self.symbol_table = symbol_table

  def translate(self, command_type, command_value):
    if command_type == 'A':
      if unicode(command_value[1]).isnumeric():
        return '{0:b}'.format(int(command_value[1:])).rjust(16, '0')
      else:
        return '{0:b}'.format(int(self.symbol_table.get_address(command_value[1:]))).rjust(16, '0')
    elif command_type == 'C':
        return 'nah'

