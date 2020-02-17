---
title: "Mixed Models in the Julia Programming Language"
output: 
  html_document:
    toc: true
    toc_depth: 4
    toc_float: true
---

Convenors: Reinhold Kliegl and Douglas Bates

## Schedule

| Time        | Monday | Tuesday | Wednesday |
|-------------|--------|---------|-----------|
| 08:00-09:00 | Breakfast | Breakfast | Breakfast |
| 09:00-10:30 | Douglas Bates: Introduction | Phillip Alday: rePCA extensions<br><br> Christina Bergmann: Reanalysis of ManyBabies1 | Anna Gert: Reanalysis of EEG data<br><br> Benedikt Ehinger / Dave Kleinschmidt: Mixed-model timeseries analysis<br><br> Hannes Matuschek: Prewhitening of LMMs |
| 10:30-11:00 | Coffee & Tea | Coffee & Tea | Coffee & Tea |
| 11:00-12:30 | Installation Check<br><br> Reinhold Kliegl: Workflow for a complex LMM example | Dave Kleinschmidt: Formulas<br><br> Bayoán Calderón: Setup of Julia projects | Phillip Alday: Julia-R bridge, Parallel threads<br><br> Douglas Bates: Confidence intervals for parameters|
| 12:30-14:00 | Lunch | Lunch | Lunch |
| 14:00-15:30 | Participant issues | Participant issues | Participant issues |
| 15:30-16:00 | Coffee & Tea | Coffee & Tea | Coffee & Tea |
| 16:00-17:30 | Lisa DeBruine: Power simulation | Participant issues | Open forum feedback |

## Notes and Links

* [Github Repositories](https://github.com/RePsychLing)
* [CheatSheet](https://juliadocs.github.io/Julia-Cheat-Sheet/)


## Introduction

*Douglas Bates*

* [LMM Complexities](https://github.com/RePsychLing/LMMComplexity)
    - `git clone https://github.com/RePsychLing/LMMComplexity.git`
    - `git clone https://github.com/dalejbarr/kronmueller-barr-2007.git`
* [NextJournal article](https://nextjournal.com/dmbates/complexity-in-fitting-linear-mixed-models/)

### Setting up

* Open the `LMMComplexity` directory in VSCode
* Open the file `Complexity.jmd`
* Shift-cmd-P to open the commands window and search for `Julia: Start REPL`
* Type `]` in the Terminal window in VSCode to get the `pkg` prompt
* pkg> `activate .`
* Use backspace to get back to the julia prompt
* Add/update some packages (get the `pkg` prompt with `]`)
    - pkg> `add Tables@0.2`
    - pkg>`add MixedModels#master`
    - pkg>`add IJulia`

### Convert .jmd to interactive python notebook

* julia> `using Weave`
* julia> `convert_doc("Complexity.jmd", "Complexity.ipynb")`
* julia> `using IJulia`
* julia> `IJulia.notebook(dir=".")`
* Some installation might happen, then your working directory will open in a web browser window. 
* Click on `Complexity.ipynb` to open it
* Put your cursor in a code block and type ctrl-Enter to run the block
    - You will see [*] to the left while it's running, and [1] after it runs.
    - Loading packages can take a long time the first time you run a script because of the precompiling.
    
### Tips

* To get greek letters, install the latex-input extension in VSCode
    - Click on the Extensions tab in the left column (looks like window panes)
    - Search for `latex-input` and click the install button
    - Now you can type, e.g., `\beta` and tab to get $\beta$
    - Type, e.g., `\_1` (tab) to get subscripts



## Installation Check

* [Tutorial Setup](https://github.com/RePsychLing/TutorialSetup)

## Workflow for a complex LMM example

*Reinhold Kliegl*

* [Github Repository](https://github.com/RePsychLing/MRK17_Exp1) 

### Setting up
* Open the `MRK17_Exp1` directory in VSCode
* Open the file `MRK17_Exp1_rk01.jmd`
* Shift-cmd-P to open the commands window and search for `Julia: Start REPL`
* Type `]` in the Terminal window in VSCode to get the `pkg` prompt
* pkg> `activate .`
* Add/update some packages (get the `pkg` prompt with `]`)
    - pkg> `add MixedModels#master`
    - pkg> `st`
* Use backspace to get back to the julia prompt

Illustrate execution from `jmd` file.
Illustrate execution from `ipynb` file  


## Power Simulation

[*Lisa DeBruine*](https://debruine.github.io)

* [GitHub Repository](https://github.com/RePsychLing/sim-tutorial) `git clone https://github.com/RePsychLing/sim-tutorial`
* [MixedModelsSim package](https://github.com/RePsychLing/MixedModelsSim.jl)
    - pkg> `add https://github.com/RePsychLing/MixedModelsSim.jl`
    
## ManyBabies

*Christina Bergmann*

* [GitHub Repository](https://github.com/RePsychLing/mb1) `git clone https://github.com/RePsychLing/mb1.git`