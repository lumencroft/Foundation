import Mathlib

/-!
# A Rigorous Logical Refutation of Cantor's Diagonal Argument

This file demonstrates the structural paradox in Cantor's Diagonal Argument.
Instead of treating the contradiction as a valid falsification of the surjectivity premise,
this code explicitly exposes the dual contradiction (Deadlock) forced by the diagonal operator:
1. Under the premise, the diagonal sequence cannot exist.
2. Under the type system's syntax, the diagonal sequence must exist.
-/

def D := ℕ → Bool

/-- The Diagonal Operator C that produces a sequence d from function f -/
def C_produces (f : ℕ → D) (d : D) : Prop :=
  ∀ n, d n = !(f n n)

/-
  [PART 1] The Contradiction of Existence (∃ d ⊢ ⊥)
  If we assume f is surjective, the diagonal sequence d cannot exist.
-/
theorem d_cannot_exist_under_surj (f : ℕ → D) (h_surj : Function.Surjective f) :
  ¬ (∃ d : D, C_produces f d) := by
  intro h_d_exists
  obtain ⟨d, hd⟩ := h_d_exists
  have hD : ∃ k, f k = d := h_surj d
  obtain ⟨k, hk⟩ := hD
  have h_step1 : d k = !(f k k) := hd k
  have h_step2 : f k k = d k := by rw [hk]
  have h_contradiction : d k = !(d k) := by
    calc
      d k = !(f k k) := h_step1
      _   = !(d k)   := by rw [h_step2]
  revert h_contradiction
  cases d k <;> decide

/-
  [PART 2] The Contradiction of Non-Existence (∄ d ⊢ ⊥)
  Regardless of the premise, the formal system (Lambda Calculus) guarantees
  that d is a perfectly valid syntactic construction. Therefore, it MUST exist.
-/
theorem d_always_exists (f : ℕ → D) : ∃ d : D, C_produces f d := by
  -- Construct the sequence directly using lambda syntax
  use (fun n => !(f n n))
  intro n
  rfl -- Trivially true by definition of the lambda function

/-
  [PART 3] The Ultimate Logical Deadlock (System Collapse)
  Combining Part 1 and Part 2 shows that introducing the surjective premise
  forces the formal system into a state where d both EXISTS and DOES NOT EXIST.
  This is a structural collapse (P ∧ ¬P), invalidating the deduction itself.
-/
theorem cantors_argument_is_structural_collapse (f : ℕ → D) (h_surj : Function.Surjective f) : False := by
  -- 1. From the premise, d does not exist
  have h_not_exists : ¬ (∃ d : D, C_produces f d) := d_cannot_exist_under_surj f h_surj

  -- 2. From the system's syntax, d exists
  have h_exists : ∃ d : D, C_produces f d := d_always_exists f

  -- 3. The logical collision (P and ¬P) leads to absolute False
  exact h_not_exists h_exists
