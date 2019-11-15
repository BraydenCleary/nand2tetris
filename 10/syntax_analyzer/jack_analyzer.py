import sys
import os
from compilation_engine import CompilationEngine
from jack_tokenizer import JackTokenizer

class JackAnalyzer:
  def __init__(self, path):
    self.absolute_path = os.path.abspath(path)
    self.dir_passed = True if os.path.isdir(self.absolute_path) else False

    if self.dir_passed:
      for _, _, input_files in os.walk(self.absolute_path):
        self.files_to_translate = ["{}/{}".format(self.absolute_path, jack_file) for jack_file in input_files if jack_file.endswith(".jack")]
    elif os.path.isfile(self.absolute_path):
      self.files_to_translate = [self.absolute_path]

  def analyze(self):
    for filename in self.files_to_translate:
      tokenizer = JackTokenizer(filename)
      compiler = CompilationEngine(tokenizer.tokens)

      self.__write_out(filename, compiler.xml_output)
  
  def __write_out(self, input_filename, output):
    output_filename = input_filename.split('.jack')[0] + '_Brayden.xml'

    with open(output_filename, "w") as output_file:
      output_file.write(output)

input_source = sys.argv[1]
a = JackAnalyzer(input_source)
a.analyze()
