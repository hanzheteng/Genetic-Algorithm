# Genetic-Algorithm
Genetic algorithm for unconstrained single-objective optimization problem.
## Problem Description
Maximize the objective function **F**, given the domain of **X** and a required percision of **0.0001**.

>`max `

> `F(x1,x2) = 21.5 + x1*sin(4*pi*x1) + x2*sin(20*pi*x2)`

>`s.t.`

>  `-3.0 <= x1 <= 12.1`

>   `4.1 <= x2 <= 5.8`

## Algorithm Description
### Representation
#### Binary String Representation
- The domain of `xj` is `[aj, bj]` and the required precision is four places after the decimal point.
- The precision requirement implies that the range of domain of each variable should be divided into at least `(bj - aj)*10^4` size ranges.
- The required bits (denoted with `mj`) for a variable is calculated as       follows: ![](https://github.com/hanzheteng/Genetic-Algorithm/tree/master/doc/encoding.png)
- The mapping from a binary string to a real number for variable `xj` is completed as follows: ![](https://github.com/hanzheteng/Genetic-Algorithm/tree/master/doc/decoding.png)

### Selection Operator
#### Roulette Wheel Selection
- In most practices, a roulette wheel approach is adopted as the selection procedure, which is one of the fitness-proportional selection and can select a new population with respect to the probability distribution based on fitness values.
- The roulette wheel can be constructed with the following steps:
![]((https://github.com/hanzheteng/Genetic-Algorithm/tree/master/doc/selection.png))
- For Roulette Wheel Selection, the best mutation probability is around **0.01**.
#### Tournament Selection
>Tournament selection:  tournament size = t

>    Repeat t times: choose a random individual from the pop and remember its fitness

>   Return the best of these t individuals (BTR)

- If t = 2, it is called Binary Tournament Selection.

- For Binary Tournament Selection, due to the high selection pressure, the best mutation probability is around **0.05**.

### Crossover Operator
#### Two Cut Points Crossover
- Crossover used here is **two-cut points** method, which random selects two cut points.
- Exchanges the middle **or** side parts of two parents to generate offspring.


### Mutation operator
#### Bit Mutation
- Alters every bit of genes with a probability equal to the mutation rate.
#### Individual Mutation
- Alters every individual with a probability equal to the mutation rate. For each mutated gene, randomly select one bit.
