class JackTokenizer:
  def __init__(self, jack_file):
    # handles lexical elements (keyword, symbol, integer constant, string constant, and identifier)
    # handles the compiler's input
    # allows: 
      # ignoring whitespace
      # advancing the input, one token at a time
      # getting the value and type of the current token
    self.jack_file = jack_file
    self.tokens = self.__parse_tokens(jack_file)

  def __parse_tokens(self, jack_file):
    tokens = []
    with open(jack_file) as f:
      for line in f.readlines():
        chars_in_line = list(line.split('//')[0].split('/**')[0].strip().replace('\n', '').replace('\r', ''))
        current_token = ''
        for index, char in enumerate(chars_in_line):
          if len(chars_in_line) == 1:
            prev_char = ''
            cur_char = char
            next_char = ''
          elif index == 0:
            prev_char = ''
            cur_char = char
            next_char = chars_in_line[index + 1]
          elif index == len(chars_in_line) - 1:
            prev_char = chars_in_line[index - 1]
            cur_char = char
            next_char = ''
          else:
            prev_char = chars_in_line[index - 1]
            cur_char = char
            next_char = chars_in_line[index + 1]
          
          current_token += char
          current_token = current_token.strip()

          if len(current_token) > 0:
            token_type = self.__parse_token_type(current_token, next_char)
            if token_type != 'INCOMPLETE':
              token_value = current_token.replace('"', '')
              tokens.append({'type': token_type, 'value': token_value})
              current_token = ''
    return tokens

  def __parse_token_type(self, token, next_character):
    if token in ('{', '}', '(', ')', '[', ']', '.', ',', ';', '+', '-', '*', '/', '&', '|', '<', '>', '=', '~'):
      return 'SYMBOL'
    elif token[0] == '"':
      if len(token) > 1 and token[-1] == '"':
        return 'STRING_CONSTANT'
      else:
        return 'INCOMPLETE'
    elif token.isdigit():
      if next_character.isdigit():
        return 'INCOMPLETE'
      else:
        return 'INT_CONSTANT'
    elif token in ('class', 'constructor', 'function', 'method', 'field', 'static', 'var', 'int', 'char', 'boolean', 'void', 'true', 'false', 'null', 'this', 'let', 'do', 'if', 'else', 'while', 'return'):
      return 'KEYWORD'
    else:
      if next_character == ' ' or next_character in ('{', '}', '(', ')', '[', ']', '.', ',', ';', '+', '-', '*', '/', '&', '|', '<', '>', '=', '~'):
        return 'IDENTIFIER'
      else:
        return 'INCOMPLETE'

  
  def keyword(self):
    # returns the keyword which is the current token, as a constant
    # should be called only if token_type == KEYWORD
    # returns CLASS, METHOD, FUNCTION, CONSTRUCTOR, INT, BOOLEAN, CHAR, VOID, VAR, STATIC, FIELD, LET, DO, IF, ELSE, WHILE, RETURN, TRUE, FALSE, NULL, THIS
    pass

  def symbol(self):
    # returns the character which is the current token
    # should be called only if token_type == SYMBOL
    pass

  def identifier(self):
    # returns the identifier which is the current token
    # should be called only if token_type == IDENTIFIER
    pass

  def int_val(self):
    # returns the integer value of the current token
    # should be called only if token_type == INT_CONST
    pass

  def string_val(self):
    # returns the string value of the current token, without the two enclosing double quotes
    # should be called only if token_type == STRING_CONST
    pass
