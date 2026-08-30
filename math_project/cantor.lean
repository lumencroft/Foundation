import Mathlib

def D := ℕ → Bool
def C_produces (f : ℕ → D) (d : D) : Prop :=
  ∀ n, d n = !(f n n)
theorem rigorous_cantor_refutation (f : ℕ → D) (h_surj : Function.Surjective f) :
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
