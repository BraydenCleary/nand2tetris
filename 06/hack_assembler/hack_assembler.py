from parser import Parser
from symbol_table import SymbolTable
from binary_translator import BinaryTraslator

class HackAssembler:
  def __init__(self, asm_filename):
    self.asm_filename = asm_filename
    self.symbol_table = SymbolTable()
    self.binary_translator = BinaryTraslator()
    self.parser = Parser()
    self.next_open_memory_address = 16

  def compile(self):
    self.__scan_for_labels()
    self.__scan_for_variables()

  def __scan_for_labels(self):
    self.__read_file_by_line(self.__add_value_to_symbol_table_if_label)

  def __scan_for_variables(self):
    self.__read_file_by_line(self.__add_value_to_symbol_table_if_variable)

  def __increment_next_open_memory_address(self):
    self.next_open_memory_address += 1

  def __read_file_by_line(self, block):
    with open(self.asm_filename) as fp:
      for cnt, line in enumerate(fp):
        block(line, cnt)

  def __add_value_to_symbol_table_if_label(self, line, cnt):
    if self.parser.is_label(line):
      self.symbol_table.add(self.parser.label_value(line), cnt + 1)

  def __add_value_to_symbol_table_if_variable(self, line, cnt):
    if self.parser.is_variable(line):
      # It's a reference to a label if our symbol table already contains the value
      if not self.symbol_table.contains(self.parser.variable_value(line)):
        self.symbol_table.add(self.parser.variable_value(line), self.next_open_memory_address)
        self.__increment_next_open_memory_address()

h = HackAssembler('/Users/braydencleary/Desktop/nand2tetris/projects/06/rect/Rect.asm')
h.compile()
