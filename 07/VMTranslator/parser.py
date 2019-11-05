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
    # Implement next project: 
      # 'C_LABEL', 'C_GOTO', 'C_IF', 'C_FUNCTION', 'C_RETURN', 'C_CALL'

    if vm_line in ARITHMETIC_COMMANDS:
      return 'C_ARITHMETIC'
    elif 'pop' in vm_line:
      return 'C_POP'
    elif 'push' in vm_line:
      return 'C_PUSH'
    else:
      raise ValueError('Unknown commmand type')

  def arg1(self, vm_line):
    command_type = self.command_type(vm_line)
    if command_type == 'C_ARITHMETIC':
      return vm_line
    elif command_type == 'C_POP':
      pop_memory_segment_type_destination = vm_line.split(' ')[1]
      return pop_memory_segment_type_destination
    elif command_type == 'C_PUSH':
      push_memory_segment_type_source = vm_line.split(' ')[1]
      return push_memory_segment_type_source

  def arg2(self, vm_line):
    command_type = self.command_type(vm_line)
    if command_type == 'C_ARITHMETIC':
      return None
    elif command_type == 'C_POP':
      pop_memory_segment_offset_destination = vm_line.split(' ')[2]
      return pop_memory_segment_offset_destination
    elif command_type == 'C_PUSH':
      push_memory_segment_offset_source = vm_line.split(' ')[2]
      return push_memory_segment_offset_source

  def __preprocess_line(self, line):
    return line.split('//')[0].strip()

