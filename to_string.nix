let
  attr = {
    someAttr = 1234;

    __toString = self: self.someAttr;
  };
in
builtins.toString attr
