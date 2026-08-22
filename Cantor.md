# A Rigorous Logical Refutation of Cantor's Diagonal Argument

**[Premise]**
Let $D$ be the universal set of all infinite sequences. 
Assume $D$ is countable, meaning there exists a surjective function $f: \mathbb{N} \to D$.
Define a diagonal sequence $d$ such that $\forall n \in \mathbb{N}, d_n \neq f(n)_n$.

**[The Three Exhaustive States]**
By the Law of Excluded Middle, exactly one of the following must logically hold for $d$:
1. $\nexists d$ ($d$ does not exist)
2. $\exists d \land d \in D$
3. $\exists d \land d \notin D$

**[Verification of Existence]**
If $d$ exists, it must satisfy either Case 2 or Case 3.

*   **Evaluating Case 2 ($d \in D$):**
    Since $f$ is surjective and $d \in D$, $\exists k \in \mathbb{N}$ such that $f(k) = d$. 
    By the definition of $d$, its $k$-th element is $d_k \neq f(k)_k$. 
    Substituting $f(k)$ with $d$ yields $d_k \neq d_k$. 
    $\therefore \bot$ (Logical Contradiction. Case 2 is False).

*   **Evaluating Case 3 ($d \notin D$):**
    By its construction rule, $d$ is an infinite sequence. 
    By definition, $D$ contains *all* infinite sequences. 
    The statement "$d$ is an infinite sequence $\land d \notin D$" directly violates the definition of $D$.
    $\therefore \bot$ (Logical Contradiction. Case 3 is False).

**[Conclusion]**
Since Cases 2 and 3 both result in strict logical contradictions, they are false. Because the three cases are collectively exhaustive, **Case 1 ($\nexists d$) is strictly true.**

Under the initial premise, the sequence $d$ cannot logically exist. Because $d$ does not exist, it cannot be invoked to produce a contradiction against the surjectivity of $f$. The argument halts at the non-existence of $d$, leaving the initial premise unbroken.
