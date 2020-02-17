---
title: "Mixed Models in the Julia Programming Language"
output: html_document
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

### Introduction: Douglas Bates

* [LMM Complexities](https://github.com/RePsychLing/LMMComplexity)
    - `git clone https://github.com/RePsychLing/LMMComplexity.git`
    - `git clone https://github.com/dalejbarr/kronmueller-barr-2007.git`
* [NextJournal article](https://nextjournal.com/dmbates/complexity-in-fitting-linear-mixed-models/)

Setting up:

* Open the `LMMComplexity` directory in VSCode
* Open the file `Complexity.jmd`
* Shift-cmd-P to open the commands window and search for `Julia: Start REPL`
* Type `]` in the Terminal window in VSCode to get the `pkg` prompt
* Type `activate .`
* Use backspace to get back to the julia prompt
* Change the version of `MixedModels`
    - Get the `pkg` prompt with `]`
    - Type `add MixedModels#master`

### Installation Check

* [Tutorial Setup](https://github.com/RePsychLing/TutorialSetup)

### Power Simulation: Lisa DeBruine

* [GitHub Repository](https://github.com/RePsychLing/sim-tutorial)
* [MixedModelsSim package](https://github.com/RePsychLing/MixedModelsSim.jl)