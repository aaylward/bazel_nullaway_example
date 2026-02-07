package com.example;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.Test;

public class HelloTest {
  @Test
  public void testGetNullableString() {
    assertThat(Hello.getNullableString()).isNull();
  }
}
