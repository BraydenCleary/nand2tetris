from xml.etree.ElementTree import ElementTree, Element, SubElement, Comment, tostring
from xml.dom.minidom import parseString

class CompilationEngine:
  def __init__(self, tokens):
    self.tokens = tokens
    self.current_token_index = 0
    self.total_tokens = len(tokens)
    self.tree = None
    self.xml_output = ''
    # this is the data structure that holds our xml for the given set of tokens
    self.root = Element('class')
    self.__compile_class()
    with open('/Users/braydencleary/Desktop/nand2tetris/projects/10/syntax_analyzer/output.xml', 'w') as output_file:
      output_file.write(parseString(tostring(self.root)).toprettyxml())

  def __compile_token(self, token_type, token_value, parent):
    sub_element = SubElement(parent, token_type.lower())
    if token_value:
      sub_element.text = token_value

    return sub_element

  def __compile_class(self):
    # class
    token = self.__current_token()
    self.__compile_token(token['type'], token['value'], self.root)
    self.current_token_index += 1

    # className
    token = self.__current_token()
    self.__compile_token(token['type'], token['value'], self.root)
    self.current_token_index += 1

    # {
    token = self.__current_token()
    self.__compile_token(token['type'], token['value'], self.root)
    self.current_token_index += 1

    self.__compile_class_var_dec()
    self.__compile_subroutine_dec()

  def __compile_class_var_dec(self):
    token = self.__current_token()
    if token['type'] != 'KEYWORD' or token['value'] not in ['static', 'field']:
      return 

    class_var_dec_root = self.__compile_token('classVarDec', None, self.root)

    while token['value'] != ';':
      self.__compile_token(token['type'], token['value'], class_var_dec_root)
      self.current_token_index += 1
      token = self.__current_token()

    # ;
    self.__compile_token(token['type'], token['value'], class_var_dec_root)
    self.current_token_index += 1

    self.__compile_class_var_dec()

  def __compile_subroutine_dec(self):
    # compiles a complete method, function, or constructor
    token = self.__current_token()

    if token['value'] not in ['constructor', 'function', 'method']:
      return

    subroutine_dec_root = self.__compile_token('subroutineDec', None, self.root)

    self.__compile_token(token['type'], token['value'], subroutine_dec_root)
    self.current_token_index += 1

    # ('void' | type)
    token = self.__current_token()
    self.__compile_token(token['type'], token['value'], subroutine_dec_root)
    self.current_token_index += 1

    # subroutine_name
    token = self.__current_token()
    self.__compile_token(token['type'], token['value'], subroutine_dec_root)
    self.current_token_index += 1    

    # (
    token = self.__current_token()
    self.__compile_token(token['type'], token['value'], subroutine_dec_root)
    self.current_token_index += 1

    self.__compile_parameter_list(subroutine_dec_root)

    # )
    token = self.__current_token()
    self.__compile_token(token['type'], token['value'], subroutine_dec_root)
    self.current_token_index += 1

    subroutine_body_root = self.__compile_token('subroutineBody', None, subroutine_dec_root)

    # {
    token = self.__current_token()
    self.__compile_token(token['type'], token['value'], subroutine_body_root)
    self.current_token_index += 1

    self.__compile_var_dec(subroutine_body_root)

    self.__compile_statements(subroutine_body_root)

    # }
    token = self.__current_token()
    self.__compile_token(token['type'], token['value'], subroutine_body_root)
    self.current_token_index += 1

    self.__compile_subroutine_dec()

  def __compile_parameter_list(self, parent):
    token = self.__current_token()
    if token['value'] == ')':
      return
    
    parameter_list_root = self.__compile_token('parameterList', None, parent)

    while token['value'] != ')':
      self.__compile_token(token['type'], token['value'], parameter_list_root)
      self.current_token_index += 1
      token = self.__current_token()

  def __compile_var_dec(self, parent):
    token = self.__current_token()
    print token
    if token['value'] != 'var':
      return

    var_dec_root = self.__compile_token('varDec', None, parent)

    while token['value'] != ';':
      self.__compile_token(token['type'], token['value'], var_dec_root)
      self.current_token_index += 1
      token = self.__current_token()

    self.__compile_token(token['type'], token['value'], var_dec_root)
    self.current_token_index += 1

    self.__compile_var_dec(parent);

  def __compile_statements(self, parent):
    token = self.__current_token()

    if token['value'] not in ['let', 'if', 'while', 'do', 'return']:
      return

    statements_root = self.__compile_token('statements', None, parent)

    while token['value'] != '}':
      {
        'let': self.__compile_let,
        'if': self.__compile_if,
        'while': self.__compile_while,
        'do': self.__compile_do,
        'return': self.__compile_return
      }[token['value']](statements_root)

  
  def __compile_let(self, parent):
    let_statement_root = self.__compile_token('letStatement', None, parent)
    token = self.__current_token()

    while token['value'] != ';':
      self.__compile_token(token['type'], token['value'], let_statement_root)
      self.current_token_index += 1
      token = self.__current_token()

    self.__compile_token(token['type'], token['value'], let_statement_root)
    self.current_token_index += 1

  def __compile_if(self, parent):
    if_statement_root = self.__compile_token('ifStatement', None, parent)
    token = self.__current_token()

    # left off here

  def __compile_while(self, parent):
    # compiles a while statement
    pass

  def __compile_do(self, parent):
    # compiles a do statement
    pass

  def __compile_return(self, parent):
    # compiles a return statement
    pass

  def compile_expression(self):
    # compiles an expression
    pass

  def compile_term(self):
    # compiles a term
    # if the current token is an identifier, the routine must distinguish between a variable, an array entry, or a subroutine call
    # a single look-ahead token, which may be one of "[", "(", or "." suffices to distinguish between the possibilities
    # any other token is not part of this term and should not be advanced over
    pass

  def compile_expression_list(self):
    # compiles a (possibly empty) comma-separated list of expressions
    pass

  def __current_token(self):
    return self.tokens[self.current_token_index]

  def __next_token(self):
    return self.tokens[self.current_token_index + 1]
