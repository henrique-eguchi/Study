package com.heguchi;

import java.util.Scanner;

public class Loops {
    public static void main(String[] args) {
        // while
        int a = 1;
        while (a <= 5) {
            System.out.println(a);
            a++;
        }

        // for
        // for (int i = 1; i <= 5; i += 1)
        for (int i = 1; i <= 5; i++) {
            System.out.println(i);
        }

        // do-while
        int d = 1;
        do {
            System.out.println(1);
        } while (d != 1);

        // Print from 1 to n
        Scanner in = new Scanner(System.in);
        int n = in.nextInt();

        for (int i = 1; i <= n; i++) {
            System.out.println(i);
        }


    }
}
