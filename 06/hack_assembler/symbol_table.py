from constants import DEFAULT_SYMBOL_TABLE_ENTRIES

class SymbolTable:
  def __init__(self):
    self.entries = {}
    self.__add_default_entries()

  def add(self, symbol, address):
    self.entries[symbol] = address

  def contains(self, symbol):
    if symbol in self.entries.keys():
      return True
    else:
      return False

  def get_address(self, symbol):
    return self.entries[symbol]

  def __add_default_entries(self):
    for symbol, address in DEFAULT_SYMBOL_TABLE_ENTRIES:
      self.add(symbol, address)