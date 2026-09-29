import Mathlib.Data.Real.Basic

def CoversAllReals (f : ℕ → ℝ) : Prop :=
  ∀ y : ℝ, ∃ n : ℕ, f n = y

noncomputable def create_diagonal_number (f : ℕ → ℝ) (h : ¬ CoversAllReals f) : ℝ :=
  sorry 

theorem cantors_failed_attempt (f : ℕ → ℝ) (cantor_assumption : CoversAllReals f) : False := by

  let d := create_diagonal_number f _
  
  sorry
