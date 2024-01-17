package com.heguchi;

public class CountingNumbers {
    public static void main(String[] args) {
        int num = 45536;
        int numberToCount = 3;
        int count = 0;

        while (num > 0) {
            int lastDigit = num % 10;
            if (lastDigit == numberToCount) {
                count++;
            }
            num /= 10; // remove last digit
        }
    }
}
