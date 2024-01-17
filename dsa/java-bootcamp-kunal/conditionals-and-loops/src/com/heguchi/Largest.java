package com.heguchi;

import java.util.Scanner;

public class Largest {
    public static void main(String[] args) {
        // Find the largest number of the 3 numbers.
        Scanner in = new Scanner(System.in);
        int a = in.nextInt();
        int b = in.nextInt();
        int c = in.nextInt();

        int max = a;

        if (b > max) {
            max = b;
        }

        if (c > max) {
            max = c;
        }

        System.out.println(max);


        // OR using Math
        int mMax = Math.max(c, Math.max(a, b));
        System.out.println("Using Math class: " + mMax);
    }
}
