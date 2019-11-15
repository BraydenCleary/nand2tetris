from xml.etree.ElementTree import ElementTree, Element, SubElement, Comment, tostring
from xml.dom.minidom import parseString

class CompilationEngine:
  def __init__(self, tokens):
    self.__tokens = tokens
    self.__current_token_index = 0
    self.__root = Element('class')
    self.__compile_class()
    self.xml_output = parseString(tostring(self.__root)).toprettyxml()

  def __compile_class(self):
    self.__compile_through('{', self.__root)
    self.__compile_class_var_dec()
    self.__compile_subroutine_dec(self.__root)
    self.__compile_through('}', self.__root)

  def __compile_class_var_dec(self):
    if self.__current_token()['value'] not in ['static', 'field']:
      return 

    class_var_dec_root = self.__add_node('class_variable_declaration', self.__root)

    self.__compile_through(';', class_var_dec_root)

    self.__compile_class_var_dec()

  def __compile_subroutine_dec(self, parent):
    if self.__current_token()['value'] not in ['constructor', 'function', 'method']:
      return

    subroutine_dec_root = self.__add_node('subroutine_declaration', parent)

    self.__compile_through('(', subroutine_dec_root)

    self.__compile_parameter_list(subroutine_dec_root)

    self.__compile_through(')', subroutine_dec_root)

    subroutine_body_root = self.__add_node('subroutine_body', subroutine_dec_root)

    self.__compile_through('{', subroutine_body_root)

    self.__compile_var_dec(subroutine_body_root)

    self.__compile_statements(subroutine_body_root)

    self.__compile_through('}', subroutine_body_root)

    self.__compile_subroutine_dec(parent)

  def __compile_parameter_list(self, parent):
    parameter_list_root = self.__add_node('parameter_list', parent)

    if self.__current_token()['value'] == ')':
      return
    
    self.__compile_until(')', parameter_list_root)

  def __compile_var_dec(self, parent):
    if self.__current_token()['value'] != 'var':
      return

    var_dec_root = self.__add_node('local_variable_declaration', parent)
    
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
  
  def __compile_let(self, parent):
    let_statement_root = self.__add_node('let_statement', parent)

    self.__compile_n_tokens(2, let_statement_root)

    if self.__current_token()['value'] == '[':
      self.__compile_through('[', let_statement_root)
      self.__compile_expression(let_statement_root)
      self.__compile_through(']', let_statement_root)

    self.__compile_through('=', let_statement_root)
    self.__compile_expression(let_statement_root)
    self.__compile_through(';', let_statement_root)

  def __compile_if(self, parent):
    if_statement_root = self.__add_node('if_statement', parent)

    self.__compile_through('(', if_statement_root)

    self.__compile_expression(if_statement_root)
    
    self.__compile_through('{', if_statement_root)

    self.__compile_statements(if_statement_root)

    self.__compile_through('}', if_statement_root)
    
    if self.__current_token()['value'] == 'else':
      self.__compile_through('{', if_statement_root)

      self.__compile_statements(if_statement_root)

      self.__compile_through('}', if_statement_root)

  def __compile_while(self, parent):
    while_statement_root = self.__add_node('while_statement', parent)

    self.__compile_through('(', while_statement_root)

    self.__compile_expression(while_statement_root)

    self.__compile_through('{', while_statement_root)

    self.__compile_statements(while_statement_root)

    self.__compile_through('}', while_statement_root)

  def __compile_do(self, parent):
    do_statement_root = self.__add_node('do_statement', parent)

    self.__compile_subroutine_call(do_statement_root)

    self.__compile_through(';', do_statement_root)

  def __compile_subroutine_call(self, parent):
    self.__compile_through('(', parent)

    self.__compile_expression_list(parent)

    # I like using the compile_through interface more than compile_n_tokens cause it's more explicit
    self.__compile_through(')', parent)  

  def __compile_expression_list(self, parent):
    expression_list_root = self.__add_node('expression_list', parent)

    if self.__current_token()['value'] == ')':
      return

    self.__compile_expression(expression_list_root)

    while self.__current_token()['value'] == ',':
      self.__compile_through(',', expression_list_root)
      self.__compile_expression(expression_list_root)

  def __compile_return(self, parent):
    return_statement_root = self.__add_node('return_statement', parent)
    
    self.__compile_n_tokens(1, return_statement_root)
    
    if self.__current_token()['value'] != ';':
      self.__compile_expression(return_statement_root)

    self.__compile_through(';', return_statement_root)

  def __compile_expression(self, parent):
    expression_root = self.__add_node('expression', parent)

    # this handles the case of the expression just being a term
    self.__compile_term(expression_root)

    while self.__current_token()['value'] in ['+', '-', '*', '/', '&', '|', '<', '>', '=']:
      self.__compile_n_tokens(1, expression_root)
      self.__compile_term(expression_root)

  def __compile_term(self, parent):
    term_root = self.__add_node('term', parent)

    if self.__current_token()['type'] in ['INTEGER_CONSTANT', 'STRING_CONSTANT', 'KEYWORD']:
      self.__compile_n_tokens(1, term_root)
    elif self.__current_token()['type'] == 'IDENTIFIER':
      if self.__next_token()['value'] == '.':
        self.__compile_subroutine_call(term_root)
      elif self.__next_token()['value'] == '[':
        self.__compile_through('[', term_root)
        self.__compile_expression(term_root)
        self.__compile_through(']', term_root)
      else:
        self.__compile_n_tokens(1, term_root)
    elif self.__current_token()['value'] == '(':
      self.__compile_through('(', term_root)
      self.__compile_expression(term_root)
      self.__compile_through(')', term_root)
    elif self.__current_token()['value'] in ['-', '~']:
      self.__compile_n_tokens(1, term_root)

  def __current_token(self):
    return self.__tokens[self.__current_token_index]

  def __next_token(self):
    return self.__tokens[self.__current_token_index + 1]

  def __compile_until(self, stop_character, parent):
    while self.__current_token()['value'] != stop_character:
      self.__compile_token(self.__current_token(), parent)

  def __compile_through(self, stop_character, parent):
    while self.__current_token()['value'] != stop_character:
      self.__compile_token(self.__current_token(), parent)    

    self.__compile_token(self.__current_token(), parent)

  def __compile_token(self, token, parent):
    self.__current_token_index += 1

    sub_element = SubElement(parent, token['type'].lower())
    
    sub_element.text = {
      '<': '&lt',
      '>': '&gt',
      '&': '&amp'
    }.get(' ' + token['value'] + ' ', ' ' + token['value'] + ' ')

    return sub_element

  def __add_node(self, token_type, parent):
    return SubElement(parent, token_type.lower())

  def __compile_n_tokens(self, number_of_tokens, parent):
    for _ in range(number_of_tokens):
      self.__compile_token(self.__current_token(), parent)