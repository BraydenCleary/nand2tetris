from constants import ARITHMETIC_COMMANDS

class Parser:
  def __init__(self, vm_filename):
    self.vm_filename = vm_filename

  def read_lines(self):
    with open(self.vm_filename) as fp:
      for line in fp:
        preprocessed_line = self.__preprocess_line(line)
        if len(preprocessed_line) > 0:
          yield preprocessed_line

  def command_type(self, vm_line):
    # Implement next: 
      # 'C_FUNCTION', 'C_RETURN', 'C_CALL'

    if vm_line in ARITHMETIC_COMMANDS:
      return 'C_ARITHMETIC'
    elif 'pop' in vm_line:
      return 'C_POP'
    elif 'push' in vm_line:
      return 'C_PUSH'
    elif 'if-goto' in vm_line:
      return 'C_IF'
    elif 'goto' in vm_line:
      return 'C_GOTO'
    elif 'label' in vm_line:
      return 'C_LABEL'
    elif 'function' in vm_line:
      return 'C_FUNCTION'
    elif 'call' in vm_line:
      return 'C_CALL'
    elif 'return' in vm_line:
      return 'C_RETURN'
    else:
      raise ValueError('Unknown commmand type')

  def arg1(self, vm_line):
    command_type = self.command_type(vm_line)
    if command_type == 'C_ARITHMETIC':
      return vm_line
    elif command_type == 'C_RETURN':
      return None
    else:
      return vm_line.split(' ')[1]

  def arg2(self, vm_line):
    command_type = self.command_type(vm_line)
    if command_type in ('C_POP', 'C_PUSH', 'C_FUNCTION', 'C_CALL'):
      return vm_line.split(' ')[2]
    else:
      return None

  def __preprocess_line(self, line):
    return line.split('//')[0].strip()

