# nextgenslog
Because who wants to do a computer's work by hand?

(is it "`NextGensLog`" or is it "`NextGenSlog`" ??)

## Steps

1. `git clone` this repo to a spot on your workstation
2. `cd` to that location in your fav terminal

3. Push to autobuilder
4. Get ridiculous log message output.
5. Copy and paste the WARNING and ERROR lines into a text file in the same directory as this cloned repo. Let's say you call the text file `AHHHHH`
6. Run `purge.sh` like so: `./purge.sh AHHHHH` -- this will remove anything we already know is DOP business, or is something we need to spend more time on separate from this project. This checks for these things in `MUST_SUPPORT` and `WE_FIX` in this same directory. Check those files to see what I mean.
7. Then, run `sort.sh` like so: `./sort.sh AHHHHH` -- this will create two new files -- a list of ERRORS and a list of WARNINGS -- and clean up / sort the output to make it easier to work with. Also adds a handy little count of WARNINGS | ERRORS to the end of each filename as a sort of running progress report throughout your day.
8. Oh, and I guess do all the actual fixing work too, right. I started some hacky automation to try and automate this part also, but these broken links really are one-offs. A few ten-offs, but nothing really that benefits from automation. Bah.

More details about what each script does and why can be found inline in `purge.sh` and `sort.sh` as comments. But just the intro, no code explanations. I wrote this stuff in like 30 minutes: helpful, descriptive comments are the first thing to get skipped!

Heh, hope this helps!
