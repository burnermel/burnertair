### Card Database:
- [ ] `Card` datatype (record syntax) with the following attributes:
  - `Name :: Text`
  - `Cost :: Cost`
    - [ ] Define `Cost` datatype
  - `SuperEffective :: Character`
    - [ ] Define `Character` datatype (record syntax) and include:
      - `Name :: Text`
      - `Effects :: [Effect]` for buffs and debuffs
        - [ ] Define an `Effect` datatype
  - `Type :: CType`
    - [ ] Define `CType` datatype and include:
      - Pejoratives
      - Slurs
      - etc.
- [ ] A "fusing" operator `(.+) :: Card -> Card -> Card`
  - This may be a constructor of `Card`
- [ ] An "evaluation" function `eval :: Card -> Context -> CEffect` that reduces complex cards and calculates the effect of the card in a given context
  - `type CEffect = Card` (effects are degenerate cards that are only created and used internally in the `eval` function)
- [ ] A `State` datatype for game state (prefereably monadic)
- [ ] A `runST :: State -> Card -> State` that runs a game turn and updates the states

### Graphics:
- [ ] Make a template for cards
- [ ] Implement a `draw` function that prints out a card
- Maybe make an ASCII version and a graphic version?
