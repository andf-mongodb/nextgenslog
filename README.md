# nextgenslog
Because who wants to do a computer's work by hand?

## Steps

1. `git clone` this repo to a spot on your workstation
2. `cd` to that location in your fav terminal

3. Push to autobuilder
4. Get ridiculous log message output.
5. Copy and paste the WARNING and ERROR lines into a text file in the same directory as this cloned repo. Let's say you call the text file `AHHHHH`
6. Run `purge.sh` like so: `./purge.sh AHHHHH` -- this will remove anything we already know is DOP business, or is something we need to spend more time on separate from this project. This checks for these things in `MUST_SUPPORT` and `WE_FIX` in this same directory
7. Run `sort.sh` like so: `./sort.sh AHHHHH` -- this will create two new files -- a list of ERRORS and a list of WARNINGS -- and clean up / sort the output to make it easier to work with. Also adds a handy little count of WARNINGS | ERRORS to the end of each filename as a sort of running progress report throughout your day.
8. Oh, and I guess do all the actual fixing work too, right. I started some hacky automation to try and automate this part also, but these broken links really are one-offs. A few ten-offs, but nothing really that benefits from automation. Bah.

Hope this helps!
