The Erlang Galaxy is under attack!! It is key for the future of the language
to keep the planets safe. In order to maximize their chances, you have been
assigned to provide a simulator that can help the Erlang Army understand how
to defend themselves from the attack of the bugs. Your simulator must be an
erlang application, and should model the following components:

* Planets, modeled as erlang processes.
* Planetary Shields, modeled as trap\_exits, which can protect one planet from the shot of a cannon.
* Interplanetary alliances, modeled as links, which bind the future of the allied planets together.
* Enemy lasers, modeled as exit signals, which are able to destroy planets without an interplanetary shield.
* Enemy nuclear cannons, modeled as exit signals, which are able to destroy planets even if those have a planetary shield.

Your application should be able to spawn a galaxy, fire some lasers and/or
nuclear cannons and explain in words what is remaining of the galaxy under the attack. i.e.

* Initial Galaxy: 2 planets with an interplanetary alliance, both of them with a planetary shield.
* Enemy Action: The bug shoots a nuclear cannon at one of the planets
* Result: The shot planet is destroyed, but the other remains intact.

Considerations:

    Use Erlang R15B03 to implement your galactic battle simulator
    Use only standard Erlang/OTP modules
    Any way of interacting with the simulator is valid as long as the output is clear: shell interface, http interface, GUI...
    Document the API of your application

Helpers:

* `make` compiles your source code
* `make test` runs the unit tests on it


