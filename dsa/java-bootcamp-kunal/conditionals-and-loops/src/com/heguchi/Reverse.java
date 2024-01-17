package com.heguchi;

public class Reverse {
    public static void main(String[] args) {
        int n = 123456789;
        int rv = 0;
        while (n > 0) {
            int rm = n % 10;
            rv = rv * 10 + rm;
            n /= 10;
        }
        System.out.println(rv);
    }
}
