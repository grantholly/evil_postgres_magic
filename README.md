W
T
F

am I doing with myself?

Hi frens.  This project is a demonstration of using postgres LISTEN / NOTIFY
to send and receive async messages from the database.  In this case, we
are going to be creating a plpython3u function that launches a subprocess
on a postgres streaming replica, and turns it into a fully read-write
database.  As part of this, we will fire off a notification about the
change to a listening async python client that will log the change.

This following stunt is perfomred by a trained "professional".  Do not try
to recreate this in your environment.
