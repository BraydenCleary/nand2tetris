from constants import COMP_MAPPINGS
from constants import DEST_MAPPINGS
from constants import JUMP_MAPPINGS

class BinaryTraslator:
  def __init__(self, parser):
    self.parser = parser

  def translate(self, line):
    command_type, command_value = self.parser.command_type_and_value(line)

    if command_type == 'A':
      address_value = self.parser.get_a_instruction_address_value(command_value)
      return '{0:b}'.format(address_value).rjust(16, '0')
    elif command_type == 'C':
      dest, comp, jump = self.parser.get_c_instruction_parts(command_value)
      binary_dest = self.__translate_c_instruction_dest(dest)
      binary_comp = self.__translate_c_instruction_comp(comp)
      binary_jump = self.__translate_c_instruction_jump(jump)
      return '111{}{}{}'.format(binary_comp, binary_dest, binary_jump)

  def __translate_c_instruction_dest(self, dest):
    return DEST_MAPPINGS[dest]

  def __translate_c_instruction_comp(self, comp):
    return COMP_MAPPINGS[comp]

  def __translate_c_instruction_jump(self, jump):
    return JUMP_MAPPINGS[jump]
