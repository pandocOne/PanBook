https://github.com/Wandmalfarbe/pandoc-latex-template v2.4.0

add the followin line before \\begin{document} to support diagram-generator:

```
\graphicspath{{/tmp/}{./figure/}{./figures/}{./image/}{./images/}{./graphics/}{./graphic/}{./pictures/}{./picture/}}
```

and, because PanBook disable extension abstract in book module, so rm abstract 5 lines.

