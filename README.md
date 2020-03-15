# org-global-props

There seems to be no standard way to get or set the buffer-global keyword
properties in Org files. For example, reading or changing this information is
difficult:

```
#+TITLE: org-global-props
#+AUTHOR: Nathanael Gentry
```


The [Kitchin
group](http://kitchingroup.cheme.cmu.edu/blog/2013/05/05/Getting-keyword-options-in-org-files/)
has an excellent solution, of course, and I have extended the regex-based solution
for property setting and validation.

[Tobias](https://emacs.stackexchange.com/questions/21459/programmatically-read-and-set-buffer-wide-org-mode-property)'s
Org-fu is nice but certainly not as fast as the Kitchin solution.
