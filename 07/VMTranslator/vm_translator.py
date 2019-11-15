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

    self.contains_sys_vm_file = True if 'Sys.vm' in ''.join(self.files_to_translate) else False
    self.output_string = ''
    self.initiate_bootstrap = False if len(sys.argv) > 2 else True
      
  def translate(self):
    for count, f in enumerate(self.files_to_translate):
      should_bootstrap = True if count == 0 else False

      code_writer = CodeWriter(f.split('.vm')[0].split('/')[-1])
      parser = Parser(f)

      for line in parser.read_lines():
        if should_bootstrap and self.initiate_bootstrap:
          self.output_string += code_writer.bootstrap(self.contains_sys_vm_file)
        should_bootstrap = False

        command_type = parser.command_type(line)
        arg1 = parser.arg1(line)
        arg2 = parser.arg2(line)
        translated_line = code_writer.generate(command_type, arg1, arg2)
        self.output_string += translated_line

    self.__write_out()

  def __write_out(self):
    if self.dir_passed:
      asm_filename = '{}/{}.asm'.format(self.absolute_path, self.absolute_path.split('/')[-1])
    else:
      asm_filename =  '{}.asm'.format(self.absolute_path.split('.vm')[0])
    with open(asm_filename, "w") as text_file:
      text_file.write(self.output_string)

if __name__ == '__main__':
  input_vm_filename = sys.argv[1]
  v = VmTranslator(input_vm_filename)
  v.translate()
