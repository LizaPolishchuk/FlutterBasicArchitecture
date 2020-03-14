<h1> Flutter basic project architecture with using Clean Architecture and BLOC</h1>

This project contains the basic logic for Flutter application with using Clean Architecture and BLOC and also useful libraries dependency in the pubspec.yaml.

<h2>About BLOC</h2>
<p>Bloc is a reactive state management pattern where data flows only in one direction. It can all be separated into three core steps:</p>
<ul>
<li><p><b>Events</b> (such as "get example text") are dispatched from the UI Widgets</p></li>
    
<li><p><b>Bloc</b> receives Events and executes appropriate business logic (calling the Use Cases, in the case of Clean Architecture).</li>

<li><p><b>States</b> are emitted from the Bloc back to the UI Widgets, which display the newly arrived data.</li>
</ul>
   
-----------------------------------------------------------------------------------------

<h2>About Clean Architecture</h2>

Below is an example schema of the project\`s structure with Clean Architecture, where all the app\`s logic divided into 3 layers - <b>data, domain and presentation</b>:

- <b>Data</b> - contain a Repository implementation (the contract comes from the domain layer) and data sources - one is usually for getting remote (API) data and the other for local caching data. 

- <b>Domain</b> - inner layer which will contain only the core business logic (use cases), business objects (entities) and the contract(abstract calss) of the repository. It should be totally independent of every other layer.

- <b>Presentation</b> - doesn't do much by itself. It delegates all its work to use cases. At most, the presentation layer handles basic input conversion and validation. Contains all screens (in our case with using bloc).



![alt text](https://miro.medium.com/max/1150/1*ezdzzfMnFob-a1AvwhOOSA.png)
