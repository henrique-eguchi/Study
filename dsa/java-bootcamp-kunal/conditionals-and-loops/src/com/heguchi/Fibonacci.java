package com.heguchi;

import java.util.Scanner;

public class Fibonacci {
    public static void main(String[] args) {
        // N-th fibonacci number

        Scanner in = new Scanner(System.in);
        int n = in.nextInt();
        int previous = 0;
        int index = 1;
        int count = 2; // previous and index - already have `2`

        if (n == 0) {
            System.out.println(n);
        } else {
            while (count <= n) {
                int temp = index;
                index = index + previous;
                previous = temp;
                count++;
            }

            System.out.println(index);
        }
    }
}
