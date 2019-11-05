import sys
from parser import Parser
from code_writer import CodeWriter

class VmTranslator:
  def __init__(self, vm_filename):
    self.vm_filename = vm_filename
    self.parser = Parser(vm_filename)
    self.code_writer = CodeWriter(vm_filename)
    self.output_string = ''

  def translate(self):
    for line in self.parser.read_lines():
      command_type = self.parser.command_type(line)
      arg1 = self.parser.arg1(line)
      arg2 = self.parser.arg2(line)
      translated_line = self.code_writer.generate(command_type, arg1, arg2)
      self.output_string += translated_line
    self.write_out()

  def write_out(self):
    base_filename = self.vm_filename.split('.vm')[0]
    asm_filename = "{}.asm".format(base_filename)
    with open(asm_filename, "w") as text_file:
      text_file.write(self.output_string)

input_vm_filename = sys.argv[1]
v = VmTranslator(input_vm_filename)
v.translate()
