package com.example;

import org.jspecify.annotations.Nullable;

public class Hello {
  public static void main(String[] args) {
    String s = getNullableString();
    if (s != null) {
      System.out.println(s.length());
    }
  }

  @Nullable
  public static String getNullableString() {
    return null;
  }
}
