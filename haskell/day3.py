from functools import partial

class Maybe():
    def __init__(self, tpe):
        self.tpe = tpe

    def bind(self, f):
        if isinstance(self.tpe, Nothing):
            return self
        else:
            return f(self.tpe.value)

    def __repr__(self):
        return repr(self.tpe)


class Just():
    def __init__(self, value):
        self.value = value

    @staticmethod
    def return_(value):
        return Maybe(Just(value))

    def __repr__(self):
        return "Just %s" % self.value


class Nothing():
    @staticmethod
    def return_():
        return Maybe(Nothing())

    def __repr__(self):
        return "Nothing"

test_dict = {'existing' : {'bar' : 42}}
def lookup(key, d):
    if key in d:
        return Just.return_(d[key])
    else:
        return Nothing.return_()

# wrap into Maybe monad
m = Just.return_(test_dict)
print(m)
# access an existing key, we should get Just result
m1 = m.bind(partial(lookup, 'existing'))
print(m1)
# access a key that does not exist, we should get Nothing
m2 = m1.bind(partial(lookup, 'notexisting'))
print(m2)
# access anything on that Nothing should return Nothing
m3 = m2.bind(partial(lookup, 'whatever'))
print(m3)
