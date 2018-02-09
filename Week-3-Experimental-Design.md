## Week 3 - Experimental Design
* Example of great results but flawed design leading to litigation
* Have a plan for data and code sharing
* (https://github.com), (http://figshare.com) - for sharing small amounts of data with scientists
* J. Leek's Data Sharing repo

### Formulate Your Question in Advance
* A large component of data science is **statistical inference**
  * **descriptive statistics** deals with a small, randomly chosen sample, **inferential statistics** helps determine if those sample results apply to a complete **population**
* **variability**
  * low variability among test groups, big difference between test groups = good, clear result!
* **confounding**
  * ex. `age` is a _confounder_ between `shoe size` and `literacy`
* correlation is not causation
  * _spurious_ correlation - you have to prove to yourself and others that there aren't other possible variables at play

### Dealing with Confounders
#### Randomization and Blocking
* fix a variable (constant for different groups)
* stratify
* otherwise, randomize

#### Prediction
* probability/sampling, training sets, training function
* prediction vs. infrerence - _prediction_ is more challenging
  * prediction key quantities:
    * see slide 19 - false positives etc.
    * Sensitivity
    * Specificity
    * Positive Predictive Value
    * Negative Predicitive Value
    * Accuracy
 * Beware data dredging and **green** jelly beans :)
   * (http://xkcd.com/882/)
 
### Summary
* Good experiments
  * Have replication
  * Measure variability
  * Generailze to the problem you care about
  * Are transparent
* Prediction is not interference
  * Both can be important
* Beware data dredging
  * dredging through your data until you find _something_ of statistical significance without crafting a hypothesis https://en.wikipedia.org/wiki/Data_dredging
