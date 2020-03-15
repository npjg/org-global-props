# org-global-props

There seems to be no standard way to get or set the buffer-global keyword
properties in Org files. The [Kitchin
group](http://kitchingroup.cheme.cmu.edu/blog/2013/05/05/Getting-keyword-options-in-org-files/)
has an excellent solution, of course, I have extended the regex-based solution
for property setting and validation.

[Tobias](https://emacs.stackexchange.com/questions/21459/programmatically-read-and-set-buffer-wide-org-mode-property)'s
org-fu is nice but certainly not as fast as the Kitchin solution.
