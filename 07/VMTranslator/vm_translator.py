import sys
import os 
from parser import Parser
from code_writer import CodeWriter

class VmTranslator:
  def __init__(self, path):
    self.absolute_path = os.path.abspath(path)
    self.dir_passed = True if os.path.isdir(self.absolute_path) else False
    if self.dir_passed:
      for _, _, input_files in os.walk(self.absolute_path):
        self.files_to_translate = ["{}/{}".format(self.absolute_path, vm_file) for vm_file in input_files if vm_file.endswith(".vm")]
    elif os.path.isfile(self.absolute_path):
      self.files_to_translate = [self.absolute_path]
    self.output_string = ''
      
  def translate(self):
    for f in self.files_to_translate:
      code_writer = CodeWriter(f.split('.vm')[0].split('/')[-1])
      parser = Parser(f)

      for line in parser.read_lines():
        command_type = parser.command_type(line)
        arg1 = parser.arg1(line)
        arg2 = parser.arg2(line)
        translated_line = code_writer.generate(command_type, arg1, arg2)
        self.output_string += translated_line
        
    self.write_out()

  def write_out(self):
    if self.dir_passed:
      asm_filename = '{}/{}.asm'.format(self.absolute_path, self.absolute_path.split('/')[-1])
    else:
      asm_filename =  '{}.asm'.format(self.absolute_path.split('.vm')[0])
    with open(asm_filename, "w") as text_file:
      text_file.write(self.output_string)

input_vm_filename = sys.argv[1]
v = VmTranslator(input_vm_filename)
v.translate()
