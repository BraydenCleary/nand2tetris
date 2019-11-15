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
    # creates a JackTokenizer instance from filename.jack
    # creates an output file named filename.xml and prepares it for writing
    # creates and uses a CompilationEngine instance to compile the input JackTokenizer into the output file
    self.output_string = ''

  def analyze(self):
    for f in self.files_to_translate:
      print f
      tokenizer = JackTokenizer(f)
      compiler = CompilationEngine(tokenizer.tokens)
      break
      # output_filename = f.split('.jack')[0] + '.xml'
      # with open(output_filename, "w") as output_file:
        # output_file.write(compiler.xml_output)


input_source = sys.argv[1]
a = JackAnalyzer(input_source)
a.analyze()
