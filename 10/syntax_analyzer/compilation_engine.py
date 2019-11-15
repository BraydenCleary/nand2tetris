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

  def __compile_class(self):
    self.__compile_n_tokens(3, self.root)

    self.__compile_class_var_dec()
    self.__compile_subroutine_dec()

  def __compile_class_var_dec(self):
    if self.__current_token()['type'] != 'KEYWORD' or self.__current_token()['value'] not in ['static', 'field']:
      return 

    class_var_dec_root = self.__add_node('classVarDec', self.root)

    self.__compile_through(';', class_var_dec_root)

    self.__compile_class_var_dec()

  def __compile_subroutine_dec(self):
    # compiles a complete method, function, or constructor
    token = self.__current_token()

    if token['value'] not in ['constructor', 'function', 'method']:
      return

    subroutine_dec_root = self.__add_node('subroutineDec', self.root)

    self.__compile_n_tokens(4, subroutine_dec_root)

    self.__compile_parameter_list(subroutine_dec_root)

    # )
    self.__compile_n_tokens(1, subroutine_dec_root)

    subroutine_body_root = self.__add_node('subroutineBody', subroutine_dec_root)

    # {
    self.__compile_n_tokens(1, subroutine_body_root)

    self.__compile_var_dec(subroutine_body_root)

    self.__compile_statements(subroutine_body_root)

    # }
    self.__compile_n_tokens(1, subroutine_body_root)

    self.__compile_subroutine_dec()

  def __compile_parameter_list(self, parent):
    if self.__current_token()['value'] == ')':
      return
    
    parameter_list_root = self.__add_node('parameterList', parent)

    self.__compile_until(')', parameter_list_root)

  def __compile_var_dec(self, parent):
    if self.__current_token()['value'] != 'var':
      return

    var_dec_root = self.__add_node('varDec', parent)
    
    self.__compile_through(';', var_dec_root)

    self.__compile_var_dec(parent);

  def __compile_statements(self, parent):
    if self.__current_token()['value'] not in ['let', 'if', 'while', 'do', 'return']:
      return

    statements_root = self.__add_node('statements', parent)

    while self.__current_token()['value'] != '}':
      {
        'let': self.__compile_let,
        'if': self.__compile_if,
        'while': self.__compile_while,
        'do': self.__compile_do,
        'return': self.__compile_return
      }[self.__current_token()['value']](statements_root)
    
    self.__compile_n_tokens(1, statements_root)
  
  def __compile_let(self, parent):
    let_statement_root = self.__add_node('letStatement', parent)

    self.__compile_through(';', let_statement_root)

  def __compile_if(self, parent):
    if_statement_root = self.__add_node('ifStatement', parent)

    self.__compile_through('{', if_statement_root)

    self.__compile_statements(if_statement_root)

    self.__compile_n_tokens(1, if_statement_root)
    
    if self.__current_token()['value'] == 'else':
      self.__compile_n_tokens(2, if_statement_root)

      self.__compile_statements(if_statement_root)

      self.__compile_n_tokens(1, if_statement_root)

  def __compile_while(self, parent):
    while_statement_root = self.__add_node('whileStatement', parent)

    self.__compile_until('{', while_statement_root)

    self.__compile_n_tokens(1, while_statement_root)

    self.__compile_statements(while_statement_root)

    self.__compile_n_tokens(1, while_statement_root)

  def __compile_do(self, parent):
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

  # helpers

  def __previous_token(self):
    return self.tokens[self.current_token_index - 1]

  def __current_token(self):
    return self.tokens[self.current_token_index]

  def __next_token(self):
    return self.tokens[self.current_token_index + 1]

  def __compile_until(self, stop_character, parent):
    while self.__current_token()['value'] != stop_character:
      self.__compile_token(self.__current_token(), parent)

  def __compile_through(self, stop_character, parent):
    while self.__current_token()['value'] != stop_character:
      self.__compile_token(self.__current_token(), parent)    

    self.__compile_token(self.__current_token(), parent)

  def __compile_token(self, token, parent):
    self.current_token_index += 1

    sub_element = SubElement(parent, token['type'].lower())
    sub_element.text = token['value']

    return sub_element

  def __add_node(self, token_type, parent):
    return SubElement(parent, token_type.lower())

  def __compile_n_tokens(self, number_of_tokens, parent):
    for _ in range(number_of_tokens):
      self.__compile_token(self.__current_token(), parent)