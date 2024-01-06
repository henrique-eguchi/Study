package com.henrique;

import java.util.Scanner;

public class TypeCasting {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        // Automatic type conversion happens when the two types are compatible
        // and the destination type should be greater than source type.
        // Example: float are bigger than integer so you can send an integer to a float
//        float num = input.nextFloat();
//        int num = input.nextInt();
//        System.out.println(num);

        // How to convert float to integer? Typecasting
        int num = (int)(67.56f);
//        System.out.println(num);

        // automatic type promotion in expressions
//        int a = 257;
//        byte b = (byte)(a); // 257 % 256 = 1

//        byte a = 40;
//        byte b = 50;
//        byte c = 100;
//        int d = a * b / c;
//
//        System.out.println(d);

//        byte b = 50;
//        b = b * 2;

//        int number = 'A';
        // Java follows Unicode
//        System.out.println("你好");

//        System.out.println(3 * 6);

        byte b = 42;
        char c = 'a';
        short s = 1024;
        int i = 50000;
        float f = 5.67f;
        double d = 0.1234;
        double result = (f * b) + (i / c) - (d * s);
        // float + int - double = double
        System.out.println((f * b) + " " + (i / c) + " " + (d * s));
        System.out.println(result);
    }
}
