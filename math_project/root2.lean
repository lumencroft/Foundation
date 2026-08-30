import Mathlib

theorem sqrt_2_irrational (a b : ℕ) (h_coprime : a.Coprime b) (h : a^2 = 2 * b^2) : False := by

  -- [단계 1] a^2 이 2의 배수임을 확인
  have h1 : 2 ∣ a^2 := ⟨b^2, h⟩

  -- [단계 2] a^2이 짝수면 a도 짝수임을 도출
  have ha_even : 2 ∣ a := by
    exact Nat.Prime.dvd_of_dvd_pow Nat.prime_two h1

  -- a가 짝수이므로 a = 2 * k 인 k가 존재함
  -- (수정) ha_even을 보존하기 위해 복사본을 만들어 분해합니다.
  have ha_even_copy := ha_even
  obtain ⟨k, hk⟩ := ha_even_copy

  -- [단계 3] b^2 도 2의 배수임을 증명
  have hb_even_sq : 2 ∣ b^2 := by
    have h2 : 2 * b^2 = 2 * (2 * k^2) := by
      calc
        2 * b^2 = a^2           := h.symm
        _       = (2 * k)^2     := by rw [hk]
        _       = 2 * (2 * k^2) := by ring

    -- 양변에서 2를 약분
    have h3 : b^2 = 2 * k^2 := by omega
    exact ⟨k^2, h3⟩

  -- [단계 4] b^2이 짝수면 b도 짝수임을 도출
  have hb_even : 2 ∣ b := by
    exact Nat.Prime.dvd_of_dvd_pow Nat.prime_two hb_even_sq

  -- [단계 5] 모순 도출: a와 b가 모두 2의 배수이면, 공약수가 2 이상이어야 함
  -- 이제 ha_even이 삭제되지 않고 남아있으므로 에러가 나지 않습니다.
  have h_gcd : 2 ∣ a.gcd b := Nat.dvd_gcd ha_even hb_even

  -- h_coprime은 사실 a.gcd b = 1 이라는 뜻
  have h_gcd_one : a.gcd b = 1 := h_coprime

  -- 최대공약수 자리를 1로 바꿔치기
  rw [h_gcd_one] at h_gcd

  -- "2가 1의 약수다"라는 거짓(False) 상태가 되므로 퀘스트 완료!
  revert h_gcd
  decide
