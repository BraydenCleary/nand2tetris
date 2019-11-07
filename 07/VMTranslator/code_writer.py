from uuid import uuid4

class CodeWriter:
  def __init__(self, base_filename):
    self.base_filename = base_filename

  def bootstrap(self, contains_sys_vm_file):
    if contains_sys_vm_file:
      sys_init_bootstrap = (
        self.__generate_call('Sys.init', 0)
      )
    else:
      sys_init_bootstrap = ''

    general_bootstrap =  (
        '// Generating bootstrap\n' +
        '@256\n' +
        'D=A\n' +
        '@SP\n' +
        'M=D\n' +
        '@5000\n' +
        'D=A\n' +
        '@LCL\n' +
        'M=D\n' +
        '@6000\n' +
        'D=A\n' +
        '@ARG\n' +
        'M=D\n' +
        '@3000\n' +
        'D=A\n' +
        '@THIS\n' +
        'M=D\n' +
        '@4000\n' +
        'D=A\n' +
        '@THAT\n' +
        'M=D\n'
      )

    return general_bootstrap + sys_init_bootstrap

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
    elif command_type == 'C_IF':
      return self.__generate_if(arg1)
    elif command_type == 'C_GOTO':
      return self.__generate_goto(arg1)
    elif command_type == 'C_LABEL':
      return self.__generate_label(arg1)
    elif command_type == 'C_FUNCTION':
      return self.__generate_function(arg1, arg2)
    elif command_type == 'C_CALL':
      return self.__generate_call(arg1, arg2)
    elif command_type == 'C_RETURN':
      return self.__generate_return()

  def __generate_function(self, function_name, local_variable_count):
    return (
      '// Generating function\n' +
      # set label for function
      '({})\n'.format(function_name) +
      # create local variables (implementing a loop here)
      '@{}\n'.format(local_variable_count) +
      'D=A\n' + 
      '@R13\n' +
      'M=D\n' +
      '@R14\n' +
      'M=0\n' +
      '({}_LOCAL_VARIABLES_LOOP)\n'.format(function_name) +
      '@R13\n' +
      'D=M\n' +
      '@R14\n' +
      'D=M-D\n' + 
      '@{}_LOCAL_VARIABLES_END\n'.format(function_name) +
      'D;JEQ\n' +
      '@SP\n' +
      'A=M\n' +
      'M=0\n' +
      '@SP\n' +
      'M=M+1\n' +
      '@R14\n' +
      'M=M+1\n' +
      '@{}_LOCAL_VARIABLES_LOOP\n'.format(function_name) +
      '0;JMP\n' +
      '({}_LOCAL_VARIABLES_END)\n'.format(function_name)
    )

  def __generate_call(self, function_name, argument_count):
    call_identifier = str(uuid4())
    arg_subtraction_string = 'D=D-1\n' * int(argument_count)
    return (
      '// Generating call\n' +
      '@RETURN_LABEL_FOR_{}_{}\n'.format(function_name, call_identifier) +
      'D=A\n' +
      '@SP\n' + 
      'A=M\n' + 
      'M=D\n' + 
      '@SP\n' + 
      'M=M+1\n' +
      '@LCL\n' +
      'D=M\n' +
      '@SP\n' + 
      'A=M\n' + 
      'M=D\n' + 
      '@SP\n' + 
      'M=M+1\n' +
      '@ARG\n' +
      'D=M\n' +
      '@SP\n' + 
      'A=M\n' + 
      'M=D\n' + 
      '@SP\n' + 
      'M=M+1\n' +
      '@THIS\n' +
      'D=M\n' +
      '@SP\n' + 
      'A=M\n' + 
      'M=D\n' + 
      '@SP\n' + 
      'M=M+1\n' +
      '@THAT\n' +
      'D=M\n' +
      '@SP\n' + 
      'A=M\n' + 
      'M=D\n' + 
      '@SP\n' + 
      'M=M+1\n' +
      # ARG = SP - n - 5
      '@SP\n' +
      'D=M-1\n' +
      'D=D-1\n' +
      'D=D-1\n' +
      'D=D-1\n' +
      'D=D-1\n' +
      arg_subtraction_string +
      '@ARG\n' +
      'M=D\n' +
      '@SP\n' +
      'D=M\n'+
      '@LCL\n' +
      'M=D\n'+
      '@{}\n'.format(function_name) +
      '0;JMP\n' +
      '(RETURN_LABEL_FOR_{}_{})\n'.format(function_name, call_identifier)
    )

  def __generate_return(self):
    # this is so wrong, need to figure out why
    return (
      '// Generating Frame = LCL\n'
      '@LCL\n' +
      'D=M\n' +
      '@temp_frame\n'+
      'M=D\n' +
      '// Generating RET = *(FRAME-5)\n'
      '@temp_frame\n' +
      'D=M-1\n' +
      'D=D-1\n' +
      'D=D-1\n' +
      'D=D-1\n' +
      'D=D-1\n' +
      'A=D\n' +
      'D=M\n' +
      '@temp_go_to_at_end_of_return\n' +
      'M=D\n'+
      '// Generating *ARG = pop()\n' +
      self.__generate_pop('temp', 0) +
      '@5\n' +
      'D=M\n' +
      '@ARG\n' +
      'A=M\n' +
      'M=D\n' +
      '// Generating SP = ARG + 1\n' +
      '@ARG\n' +
      'D=M\n' +
      '@SP\n' +
      'M=D+1\n' +
      '// Generating THAT = *(FRAME-1)\n' +
      '@temp_frame\n' +
      'D=M\n' +
      'D=D-1\n' +
      'A=D\n' +
      'D=M\n' +
      '@THAT\n' +
      'M=D\n' +
      '// Generating THIS = *(FRAME-2)\n' +
      '@temp_frame\n' +
      'D=M\n' +
      'D=D-1\n' +
      'D=D-1\n' +
      'A=D\n' +
      'D=M\n' +
      '@THIS\n' +
      'M=D\n' +
      '// Generating ARG = *(FRAME-3)\n' +
      '@temp_frame\n' +
      'D=M\n' +
      'D=D-1\n' +
      'D=D-1\n' +
      'D=D-1\n' +
      'A=D\n' +
      'D=M\n' +
      '@ARG\n' +
      'M=D\n' +
      '// Generating LCL = *(FRAME-4)\n' +
      '@temp_frame\n' +
      'D=M\n' +
      'D=D-1\n' +
      'D=D-1\n' +
      'D=D-1\n' +
      'D=D-1\n' +
      'A=D\n' +
      'D=M\n' +
      '@LCL\n' +
      'M=D\n' +
      '@temp_go_to_at_end_of_return\n' +
      'A=M\n' +
      '0;JMP\n'
    )

  def __generate_if(self, label_name):
    return (
      '// Generating if\n' +
      '@SP\n' +
      'A=M-1\n' +
      'D=M\n' +
      '@SP\n' +
      'M=M-1\n' +
      '@{}\n'.format(label_name) +
      'D;JNE\n'
    )

  def __generate_goto(self, label_name):
    return (
      '// Generating goto\n'
      '@{}\n'.format(label_name) +
      '0;JMP\n'
    )

  def __generate_label(self, label_name):
    return (
      '// Generating label\n' +
      '({})\n'.format(label_name)
    )

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
    eq_identifier = str(uuid4())
    return (
      '// Generating eq\n' +
      '@SP\n' + 
      'A=M-1\n' + 
      'D=M\n' + 
      'A=A-1\n' + 
      'D=M-D\n' + 
      '@IS_EQUAL_{}\n'.format(self.eq_identifier) + 
      'D;JEQ\n' + 
      '@IS_NOT_EQUAL_{}\n'.format(self.eq_identifier) + 
      'D;JNE\n' + 
      '(IS_EQUAL_{})\n'.format(self.eq_identifier) + 
      '@SP\n' +
      'A=M-1\n' +
      'A=A-1\n' +
      'M=-1\n' +
      '@EQ_END_{}\n'.format(self.eq_identifier) + 
      '0;JMP\n' + 
      '(IS_NOT_EQUAL_{})\n'.format(self.eq_identifier) + 
      '@SP\n' + 
      'A=M-1\n' + 
      'A=A-1\n' +
      'M=0\n' + 
      '@EQ_END_{}\n'.format(self.eq_identifier) + 
      '0;JMP\n' + 
      '(EQ_END_{})\n'.format(self.eq_identifier) +
      '@SP\n' +
      'M=M-1\n'
    )
  
  def __generate_gt(self):
    gt_identifier = str(uuid4())
    return (
      '// Generating gt\n' +
      '@SP\n' +
      'A=M-1\n' +
      'D=M\n' +
      'A=A-1\n' +
      'D=M-D\n' +
      '@X_IS_GREATER_{}\n'.format(gt_identifier) +
      'D;JGT\n' +
      '@X_IS_NOT_GREATER_{}\n'.format(gt_identifier) +
      'D;JLE\n' +
      '(X_IS_GREATER_{})\n'.format(gt_identifier) +
      '@SP\n' +
      'A=M-1\n' +
      'A=A-1\n' +
      'M=-1\n' +
      '@GT_END_{}\n'.format(gt_identifier) +
      '0;JMP\n' +
      '(X_IS_NOT_GREATER_{})\n'.format(gt_identifier) +
      '@SP\n' +
      'A=M-1\n' +
      'A=A-1\n' +
      'M=0\n' +
      '@GT_END_{}\n'.format(gt_identifier) +
      '0;JMP\n' +
      '(GT_END_{})\n'.format(gt_identifier) +
      '@SP\n' +
      'M=M-1\n'
    )
  
  def __generate_lt(self): 
    lt_identifier = str(uuid4())
    return (
      '// Generating lt\n' +
      '@SP\n' + 
      'A=M-1\n' + 
      'D=M\n' + 
      'A=A-1\n' + 
      'D=M-D\n' + 
      '@X_IS_LESS_THAN_{}\n'.format(lt_identifier) + 
      'D;JLT\n' + 
      '@X_IS_NOT_LESS_THAN_{}\n'.format(lt_identifier) + 
      'D;JGE\n' + 
      '(X_IS_LESS_THAN_{})\n'.format(lt_identifier) + 
      '@SP\n' + 
      'A=M-1\n' +
      'A=A-1\n' + 
      'M=-1\n' + 
      '@LT_END_{}\n'.format(lt_identifier) + 
      '0;JMP\n' + 
      '(X_IS_NOT_LESS_THAN_{})\n'.format(lt_identifier) + 
      '@SP\n' + 
      'A=M-1\n' + 
      'A=A-1\n' +
      'M=0\n' + 
      '@LT_END_{}\n'.format(lt_identifier) + 
      '0;JMP\n' + 
      '(LT_END_{})\n'.format(lt_identifier) +
      '@SP\n' +
      'M=M-1\n'
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
        '@16\n' + 
        'D=A\n' + 
        '@{}\n'.format(segment_offset) + 
        'A=D+A\n' + 
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
        '@16\n'
        'D=A\n' +
        '@{}\n'.format(segment_offset) +
        'D=D+A\n'
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
