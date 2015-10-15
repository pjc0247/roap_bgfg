roap_bgfg
====

백그라운드 스레드와 포그라운드 스레드간의 간편한 전환을 제공합니다.

```rb
class MyView
  # background
  def load_data
    /* 웹에서 데이터 로드 등... */
    
    apply
  end
  
  # foreground
  def apply
    /* UI에 불러온 결과 반영 */
  end
end
```

위의 예제 코드에서 `load_data`메소드는 어느 스레드에서 부르는 관계 없이 항상 백그라운드 스레드에서 동작함이 보장됩니다.
반대로 `apply`메소드는 어느 스레드에서 부르던지에 관계 없이 항상 포그라운드 스레드에서 호출됩니다.

```rb
# foreground-sync
def apply
  /* ... */
end
```
`foreground-sync` 속성을 사용하면 백그라운드에서 실행된 포그라운드 콜이 동기적으로 동작합니다.
