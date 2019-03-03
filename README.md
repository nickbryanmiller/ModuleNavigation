# ModuleNavigation
Basic iOS navigation using an IntentHandler system.

# How Do I Add A New Route?
- Create a new Intent in IntentModule. (look at NMIntentGoToAnimalPage for guidance)
- Create a new IntentHandler in IntentHandlerModule. (look at NMIntentHandlerGoToAnimalPage)
- Open NMIntentHandlerSystem in IntentHandlerModule and add your checks there (just like with NMIntentHandlerGoToAnimalPage)
#### You are done! Now you can use it 😃 (example in didTapButton() in ExploreViewController)

# Intent Handler Checkmarks
- [x] No Buck Dependency Cycles
- [x] Easy for a developer to use and learn
- [x] Works with multiple apps sharing dependencies (each has their own IntentHandlerSystem but IntentHandlerBasics is another module with the base protocol).
- [x] Can be used in conjunction with (but does not rely on) Navigators, Dependency Injection, Coordinators, FactoryMethods
- [x] No duplicate code
- [x] Dynamic
- [x] Fast if large by using “namespacing” (breaking into appropriate sub modules or searching by module extention to NMIntent)
- [x] Allows for logic to be performed before move (such as converting from one model type to another)
- [x] Allows for "middleware" - additional logic in the canHandle function as well as redirecting the user before anything is called at all
- [x] Navigation type is abstracted away
- [x] Deep links would only exist at the top level of the app to switch to apps. IntentHandlers would use the necessary deep links to leave the app and the app would create the desired intents upon receiving a deep link


# Improvements & Thoughts
- [ ] Static Methods for inside handling instead of instantiation
- [ ] Hide intentHandler (and navigation object) inside parent vc so does not need be passed in the init
- [ ] Structs vs Classes vs Protocol passing
- [ ] Is there a way to not even specify the methods from a pre-compile standpoint (i dont think so)? Registering would result in dynamic bugs
- [ ] Maybe could put static classes in array (like objc lets you do)
- [X] Usage:
    - IntentHandler is for navigation between unrelated modules
    - NavigationController directly is for navigation in dependency tree
    - TabBarController switching can easily be incorporated too by knowing the origin module and asking tab bar if should switch tabs
    - Deep Links are for leaving the app (and an intent should be made such as NMIntentGoToOtherAppWithCustomAppDestination) and are for entering the app then would use an intent to reach the destination
