# Nearby Venues
The app shows venue list near user location.

# Base tooling
- `TinyConstraints` is programmatically Auto Layout library.
- `Alamofire` is an HTTP networking library.


# Why Alamofire?
While Alamofire is based on URLSession, it obscures many of the difficulties of making networking calls, freeing you to concentrate on your business logic. You can access data on the internet with little effort, and your code will be cleaner and easier to read.
- The request is build up within a single initializer
- A URL encoder is encoding parameters by default
- Validation is done inline with a simple one-liner and converts into a strongly typed error if validation fails. The response result enum will return this error   inside the failure case.
- A generic completion callback makes it easy to decode the response into our custom Board type


# Why TinyConstraints and Auto Layout Programmatically?
- TinyConstraints library makes easier building UI and saves time.
- No need to open different windows for storyboards, to understand what’s happening in a single module.
- Everything is here, you can see very clearly what’s happening in the layout.
- Makes your compile-time stable, as the project grows.
- Easy to refactor.
- Easy to work in a team.
- Hard to review the code


# Architecture
MVVM + R architecture was used in this project

## Models
The models won't store business logic. They will only act as data stores.

## Views
The `Views` (or `ViewControllers` in this case) only responsability will be displaying the data provided by its `ViewModel`, and forwarding all events to their respective `ViewModel`.

## ViewModel
The `ViewModel` is the component in charge of managing the state of each view, and any processing necesary of the data to be displayed.

## Router
The router is the component in charge of handling the navigation stack of your entire application. 

To keep things tidy and isolated, the router does not know how to instantiate the screens that it presents. This is defined separately using the `Route` protocol. A `Route` is a component that encapsulates all the necessary logic to instantiate a `view`, with it's corresponding `viewModel` and any other parameters forwarded from other routes.
