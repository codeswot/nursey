# nursey

Flutter Assignment for Dexter-health

## Getting Started

1. I would have implemented a midleware that checks the current time, and checks the Nurses on duty
and send a push notifications for pending task, esspecialy task left from last shift (hence in the DB i added start time and end time for each shift)
2. i would have added reminders for tasks depending on severity level

This is an exciting one, 
although with the short time, i was only able to do mostly engineering setups, like bloc, service and repository
i relay wished the task had more time , so i could go all out on it
I was only able to complete, view tasks, and create new task assigning a task to a shift
the plan was to give access to tasks to all nurses running that shift,
if a task in not completed, a nurse can re assign it to the next shift
.. if given the chance i would love to explain more on my solutions
or perhaps get more time to ace it .

As for UI, i have all elements in place, would have use the material design pattern well enough
but am time concerned 

I planned to write some unit and integration test, 24 hrs is a lot but quite short to think
things through

Make Sure to run:
[flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs && clear] after adding models # nursey
