### Card Database:
- [ ] `Card` datatype (record syntax) with the following attributes:
  - `Name :: Text`
  - `Cost :: Cost`
  - `SuperEffective :: [Trait]`
    - [ ] Define `Character` datatype (record syntax) and include:
      - `Name :: Text`
      - `Effects :: [Effect]` for buffs and debuffs
        - [ ] Define an `Effect` datatype
		  - Fix `Effect` data constructor names
  - `Type :: CType`
    - [ ] Define `CType` datatype and include:
      - Pejoratives
      - Slurs
      - etc.
- [x] A "fusing" operator `(.+) :: Card -> Card -> Card`
  - This may be a constructor of `Card`
- [ ] An "evaluation" function `eval :: Card -> Context -> CEffect` that reduces complex cards and calculates the effect of the card in a given context
  - `type CEffect = Card` (effects are degenerate cards that are only created and used internally in the `eval` function)
- [ ] A `State` datatype for game state (prefereably monadic)
- [ ] A `runST :: State -> Card -> State` that runs a game turn and updates the states

### Graphics:
- [ ] Make a template for cards
- [ ] Implement a `draw` function that prints out a card
- Maybe make an ASCII version and a graphic version?

### Execution:
- [ ] Make sure to apply card effects from best to worst
  -  If a card inflicts damage that will be reflected and *then* block, this may result in an avoidable death.
  - One way to avoid such things is to list the +'s and *then* the -'s of the card in its description, or to just make sure the description matches execution order.
- [ ] Either prevent characters with identical names from battling **(preferred strategy)**, or assign players unique IDs.
- [ ] Include a `Undead` trait that revives the player upon death.
- [ ] Keep track of PR regeneration and draw count for each turn.
- [ ] In each phase (`initTurn`, `endTurn`, etc.), use helper functions that check for traits.
  - Alternatively, store a list of effects that apply at specific turn phases.
- Look into **Monad Transformers** and **Effect Libraries** for a way to separate pure and effectful parts of `GST`.
  - Use the `prompt` package
- Use better data types:
  - Replace lists by other containers.
  - Use `Word8`, `Int16`, etc., or custom data types instead of `Int` for stats.

### Documentation:
- Everything should be well-documented in Haddock syntax.
- Avoid adding temporary comments and TODOs in the source file; use this file instead.

### Project Hierarchy:
- [x] Main: initiates the app.
- [x] Game: specifies game mechanics with `prompt`.
  - [x] Data: exports the database of characters, traits, cards, etc.
    - [x] Characters
	- [x] Cards
	- [x] Effects
	- [x] Traits
  - [x] State: game state.
    - [x] Lens: setters and getters for `GState` used to define effects.
  - [x] Player: `PStats` and `mkPlayer`.
  - [x] Card
    - [x] Graphics: exports a specific graphical representation of cards.
	  - [x] Text
	  - [x] ASCII
	  - [x] Image
  - [x] Effect: to be used in both `Card` and `Character.Trait`. An `Effect` is a `GState` lens.
  - [x] Character
    - [x] Trait
  - [x] IO: exports a certain IO for the game.
    - [x] Text
	- [x] GUI
