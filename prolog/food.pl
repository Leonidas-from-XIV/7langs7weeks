food_type(velveeta, cheese).
food_type(ritz, cracker).
food_type(spam, meat).
food_type(sausage, meat).
food_type(jolt, soda).
food_type(twinkie, dessert).

flavour(sweet, desert).
flavour(savory, meat).
flavour(savory, cheese).
flavour(sweet, soda).

food_flavour(X, Y) :- food_type(X, Z), flavour(Y, Z).
