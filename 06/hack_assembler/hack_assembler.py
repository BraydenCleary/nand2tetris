import filecmp
from parser import Parser
from symbol_table import SymbolTable
from binary_translator import BinaryTraslator

class HackAssembler:
  def __init__(self, asm_filename):
    self.asm_filename = asm_filename
    self.symbol_table = SymbolTable()
    self.parser = Parser(self.symbol_table)
    self.binary_translator = BinaryTraslator(self.parser)
    self.next_open_memory_address = 16
    self.labels_parsed = 0
    self.output_string = ''

  def compile(self):
    # self.__remove_commented_and_empty_lines()
    self.__scan_for_labels()
    self.__scan_for_variables()
    self.__translate_to_binary()
    self.__write_to_out_file()

  # def __remove_commented_and_empty_lines(self):
  #   self.__read_file_by_line(self.__remove_commented_or_empty_line)

  # def __remove_commented_or_empty_line(self, line, cnt):
  #   line = line.split('//')[0].strip().replace(' ', '')
  #   if len(line) > 0:
  #     self.output_string += "{}\n".format(line)

  def __scan_for_labels(self):
    self.__read_file_by_line(self.__add_value_to_symbol_table_if_label)

  def __scan_for_variables(self):
    self.__read_file_by_line(self.__add_value_to_symbol_table_if_variable)

  def __translate_to_binary(self):
    self.__read_file_by_line(self.__translate_line_to_binary)

  def __write_to_out_file(self):
    base_filename = self.asm_filename.split('.asm')[0]
    hack_filename = "{}_Brayden.hack".format(base_filename)
    with open(hack_filename, "w") as text_file:
      text_file.write(self.output_string)

  def __read_file_by_line(self, block):
    lines_processed = 0
    with open(self.asm_filename) as fp:
      for line in fp:
        line = self.__preprocess_line(line)
        if len(line) > 0:
          block(line, lines_processed)
          lines_processed += 1

  def __preprocess_line(self, line):
    return line.split('//')[0].strip().replace(' ', '')

  def __add_value_to_symbol_table_if_label(self, line, cnt):
    if self.parser.is_label(line):
      self.symbol_table.add(self.parser.label_value(line), cnt - self.labels_parsed)
      self.labels_parsed += 1

  def __add_value_to_symbol_table_if_variable(self, line, cnt):
    if self.parser.is_variable(line):
      if not self.symbol_table.contains(self.parser.variable_value(line)):
        self.symbol_table.add(self.parser.variable_value(line), self.next_open_memory_address)
        self.__increment_next_open_memory_address()

  def __translate_line_to_binary(self, line, _):
    binary_command = self.binary_translator.translate(line)
    if binary_command:
      self.output_string += '{}\n'.format(binary_command)

  def __increment_next_open_memory_address(self):
    self.next_open_memory_address += 1

filenames = [
  '/Users/braydencleary/Desktop/nand2tetris/projects/06/max/Max.asm',
  '/Users/braydencleary/Desktop/nand2tetris/projects/06/pong/Pong.asm',
  '/Users/braydencleary/Desktop/nand2tetris/projects/06/rect/Rect.asm'
]

for f in filenames:
  HackAssembler(f).compile()

print "Testing if assembler is working:"
print filecmp.cmp('/Users/braydencleary/Desktop/nand2tetris/projects/06/max/Max.hack',    '/Users/braydencleary/Desktop/nand2tetris/projects/06/max/Max_Brayden.hack')
print filecmp.cmp('/Users/braydencleary/Desktop/nand2tetris/projects/06/pong/Pong.hack',  '/Users/braydencleary/Desktop/nand2tetris/projects/06/pong/Pong_Brayden.hack')
print filecmp.cmp('/Users/braydencleary/Desktop/nand2tetris/projects/06/rect/Rect.hack',  '/Users/braydencleary/Desktop/nand2tetris/projects/06/rect/Rect_Brayden.hack')
