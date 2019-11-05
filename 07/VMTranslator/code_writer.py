class CodeWriter:
  def __init__(self, vm_filename):
    self.base_filename = vm_filename.split('.vm')[0].split('/')[-1]

  def generate(self, command_type, arg1, arg2):
    if command_type == 'C_ARITHMETIC':
      arg1_generator = {
        'add': self.__generate_add,
        'sub': self.__generate_sub,
        'neg': self.__generate_neg,
        'eq':  self.__generate_eq,
        'gt':  self.__generate_gt,
        'lt':  self.__generate_lt,
        'and': self.__generate_and,
        'or':  self.__generate_or,
        'not': self.__generate_not
      }[arg1]
      return arg1_generator()
    elif command_type == 'C_PUSH':
      return self.__generate_push(arg1, arg2)
    elif command_type == 'C_POP':
      return self.__generate_pop(arg1, arg2)

  def __generate_add(self):
    return (
      '// Generating add\n' +
      '@SP\n' + 
      'A=M-1\n' + 
      'D=M\n' + 
      'A=A-1\n' + 
      'D=D+M\n' + 
      'M=D\n' + 
      '@SP\n' + 
      'M=M-1\n'
    )

  def __generate_sub(self):
    return (
      '// Generating sub\n' +
      '@SP\n' + 
      'A=M-1\n' + 
      'D=M\n' + 
      'A=A-1\n' + 
      'D=M-D\n' + 
      'M=D\n' + 
      '@SP\n' + 
      'M=M-1\n'
    )

  def __generate_neg(self):
    return (
      '// Generating neg\n' +
      '@SP\n' + 
      'A=M-1\n' + 
      'D=-M\n' + 
      'M=D\n'
    )
  
  def __generate_eq(self):
    return (
      '// Generating eq\n' +
      '@SP\n' + 
      'A=M-1\n' + 
      'D=M\n' + 
      'A=A-1\n' + 
      'D=M-D\n' + 
      '@IS_EQUAL\n' + 
      'D;JEQ\n' + 
      '@IS_NOT_EQUAL\n' + 
      'D;JNE\n' + 
      '(IS_EQUAL)\n' + 
      '@SP\n' + 
      'A=M-1\n' + 
      'M=-1\n' + 
      '@END\n' + 
      '0;JMP\n' + 
      '(IS_NOT_EQUAL)\n' + 
      '@SP\n' + 
      'A=M-1\n' + 
      'M=0\n' + 
      '@END\n' + 
      '0;JMP\n' + 
      '(END)\n' + 
      '@1\n'
    )
  
  def __generate_gt(self):
    return (
      '// Generating gt\n' +
      '@SP\n' +
      'A=M-1\n' +
      'D=M\n' +
      'A=A-1\n' +
      'D=M-D\n' +
      '@X_IS_GREATER\n' +
      'D;JGT\n' +
      '@X_IS_NOT_GREATER\n' +
      'D;JLE\n' +
      '(X_IS_GREATER)\n' +
      '@SP\n' +
      'A=M-1\n' +
      'M=-1\n' +
      '@END\n' +
      '0;JMP\n' +
      '(X_IS_NOT_GREATER)\n' +
      '@SP\n' +
      'A=M-1\n' +
      'M=0\n' +
      '@END\n' +
      '0;JMP\n' +
      '(END)\n' +
      '@1\n'
    )
  
  def __generate_lt(self):
    return (
      '// Generating lt\n' +
      '@SP\n' + 
      'A=M-1\n' + 
      'D=M\n' + 
      'A=A-1\n' + 
      'D=M-D\n' + 
      '@X_IS_LESS_THAN\n' + 
      'D;JLT\n' + 
      '@X_IS_NOT_LESS_THAN\n' + 
      'D;JGT\n' + 
      '(X_IS_LESS_THAN)\n' + 
      '@SP\n' + 
      'A=M-1\n' + 
      'M=-1\n' + 
      '@END\n' + 
      '0;JMP\n' + 
      '(X_IS_NOT_LESS_THAN)\n' + 
      '@SP\n' + 
      'A=M-1\n' + 
      'M=0\n' + 
      '@END\n' + 
      '0;JMP\n' + 
      '(END)\n' + 
      '@1\n'
    )
  
  def __generate_and(self):
    return (
      '// Generating and\n' +
      '@SP\n' +
      'A=M-1\n' +
      'D=M\n' +
      'A=A-1\n' +
      'M=M&D\n' +
      '@SP\n' +
      'M=M-1\n'
    )
  
  def __generate_or(self):
    return (
      '// Generating or\n' +
      '@SP\n' +
      'A=M-1\n' +
      'D=M\n' +
      'A=A-1\n' +
      'M=M|D\n' +
      '@SP\n' +
      'M=M-1\n'
    )
  
  def __generate_not(self):
    return (
      '// Generating not\n' +
      '@SP\n' +
      'A=M-1\n' +
      'D=!M\n' +
      'M=D\n'
    )

  def __generate_push(self, segment_type, segment_offset):
    if segment_type == 'constant':
      value_to_be_pushed = (
        '@{}\n'.format(segment_offset) +
        'D=A\n'
      )
    elif segment_type == 'pointer':
      value_to_be_pushed = (
        '@{}\n'.format('THIS' if segment_offset == '0' else 'THAT') +
        'D=M\n'
      )
    elif segment_type == 'static':
      value_to_be_pushed = (
        '@{}.{}\n'.format(self.base_filename, segment_offset) +
        'D=M\n'
      )
    elif segment_type == 'temp':
      value_to_be_pushed = (
        '@5\n' + 
        'D=A\n' + 
        '@{}\n'.format(segment_offset) + 
        'A=D+A\n' + 
        'D=M\n'
      )
    else:
      symbol_for_segment_type = {
        'local': '@LCL',
        'argument': '@ARG',
        'this': '@THIS',
        'that': '@THAT',
      }[segment_type]

      value_to_be_pushed = (
        '{}\n'.format(symbol_for_segment_type) + 
        'D=M\n' + 
        '@{}\n'.format(segment_offset) + 
        'A=D+A\n' + 
        'D=M\n'
      )

    return (
      '// Generating push\n' +
      value_to_be_pushed + 
      '@SP\n' + 
      'A=M\n' + 
      'M=D\n' + 
      '@SP\n' + 
      'M=M+1\n'
    )

  def __generate_pop(self, segment_type, segment_offset):
    if segment_type == 'static':
      pop_destination = (
        '@{}.{}\n'.format(self.base_filename, segment_offset) +
        'D=A\n'
      )
    elif segment_type == 'pointer':
      pop_destination = (
        '@{}\n'.format('THIS' if segment_offset == '0' else 'THAT') + 
        'D=A\n'
      )
    elif segment_type == 'temp':
      pop_destination = (
        '@5\n'
        'D=A\n' +
        '@{}\n'.format(segment_offset) +
        'D=D+A\n'
      )
    else:
      symbol_for_segment_type = {
        'local': '@LCL',
        'argument': '@ARG',
        'this': '@THIS',
        'that': '@THAT'
      }[segment_type]

      pop_destination = (
        '{}\n'.format(symbol_for_segment_type) +
        'D=M\n' +
        '@{}\n'.format(segment_offset) +
        'D=D+A\n'
      )

    return (
      '// Generating pop\n' +
      '@SP\n' +
      'A=M-1\n' +
      'D=M\n' +
      '@R13\n' +
      'M=D\n' +
      pop_destination +
      '@R14\n' +
      'M=D\n' +
      '@R13\n' +
      'D=M\n' +
      '@R14\n' +
      'A=M\n' +
      'M=D\n' +
      '@SP\n' +
      'M=M-1\n'
    )
