# Become a Mountain Guide App 

An app to track your progress to becoming a British Mountain Guide Trainee. 

Design pattern: MVVM-C

Architecture: Hexagonal (ish)

IDE: Xcode 11.2

Language: Swift 5

Tools: SQLite, cocoapods 

## Development Techniques:
- TDD
- Unit testing 
- UI testing
- Object mocking
- Protocols to reduce direct dependancy
- Run scripts
- Launch Arguments
- Navigation Controllers
- TableViewControllers
- Uses [SQLite.swift](https://github.com/stephencelis/SQLite.swift) framework. This dependency is managed via cocoapods. Adds a swift language layer over [SQLite3](https://www.sqlite.org/index.html). 

## Further work & improvements
	- Dependency Inversion for BMG & teach DI to Jenna
	- Then if there’s time inject services into VC rather than having to use the real ones for test? 
	- Add an observer to BMG
	- Add coordinators so you're not using storyboards (done)
	- Add remote backend (e.g. AWS database) to persist data remotely. 
	- [ ] Add further functions - Winter  alpine climbing and Scottish climbing, integrate maps, USP log ski touring
	- [ ] Mocks are in the folders of the real implementations
	- [ ] Add a logRockClimbProtocol whose member is a view model with VC as implementation and mock for testing to make it more hexagonal