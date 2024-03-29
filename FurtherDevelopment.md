## BMG App Further Work & Improvements

- Dependency Inversion for BMG.
- Then if there’s time inject services into VC rather than having to use the real ones for test? 
- Add an observer to BMG.
- Add coordinators so you're not using storyboards (done). Test these coordinators.
- Add remote backend (e.g. AWS database) to persist data remotely. 
- Add further functions - Winter  alpine climbing and Scottish climbing, integrate maps, USP log ski touring.
- Add a logRockClimbScreenProtocol whose member is a view model with VC as implementation and mock for testing to make it more hexagonal.

## Developer Comments

### MVVM-C Design Pattern & Hexagonal Architeture

- The "View" protocols are only used to link the view models with the appropriate views. 
- There is a view protocol missing for LogRockClimbScreen, as this was the first screen implemented. As this does not have a protocol, this is breaking the ports and adapters architecture principle.

- UI tests were never re-written following introduction of the App Coordinator (ran out of time). Testing could use a hosted app. Testing of coordinator was investigated, see the following repo: 
	- https://github.com/bbc/TDD_Coordinators_TestingAppDelegate

- Other (disregarded) investigations here:
	- https://github.com/bbc/TDD_Coordinators
	- https://github.com/bbc/TDD_Coordinators_Framework

- Using the coordinator did allow removal of storyboard transitions which was nice.

- The database manages and uses a lot of the "model" concerns - separation here could be better. 
- Also the Model type is pssed into the VC in the LogbookViewModel - breaks the MVVM-C separation. 


- The App Coordinator can become a bit of a God class because it does all the gluing together. E.g. 
	- It identifies the screen required using the accessibility identifier
	- it sets the appropriate view model for the identified view. 
	- it adds the appropriate database service for the VM via a factory.
	- it sets itself as the nav controller for the VM
	... 🙈

- You could farm out VM creation to a ViewModel Factory. This could use the already existing DatabaseServiceFactory. 
- You could farm out VC creation to a factory and pass in the previously created VM 
- You could even factory out the creation of different types of co-ordinators if your app was big enough to warrant it. 
- See Trivago use of MVVM-C [here](https://tech.trivago.com/post/2016-08-26-mvvmc/).

### Notes on Current Status

- Launch arguments were used to clear the database in the UI tests to ensure reproducible db environment.
- Mocks are in the folders of the real implementations. Would probably be better in testing folders.
- N.B. ensure you have switched off toggling to hardware keyboard on the simulator for UI Tests. 
- UI tests mega flakey - e.g. if a small phone is used the submit button may not be on screen. 

### Notes on Development Process

- This work gave basis for the SMP Sample App Update in terms of rough architecture. 
- This gave me an opportunity to get to know the processes of the team including project management, TDD, pairing. 
- This gave me experience in using software architectures and patterns. Also experience in leading a piece of development - being accountable for the features, design, getting buy in from team etc. 
