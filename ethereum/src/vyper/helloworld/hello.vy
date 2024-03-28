theBool: public(bool)

@internal
def topFunction() -> bool:
  self.theBool = True
  return self.theBool

@external
def lowerFunction():
  assert self.topFunction()

