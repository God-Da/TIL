import java.util.Scanner;

public class FibonacciExample {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("피보나치 수열의 길이를 입력하세요: ");
        int n = scanner.nextInt();

        int a = 0, b = 1;

        System.out.print("피보나치 수열: ");
        for (int i = 1; i <= n; i++) {
            System.out.print(a + " ");
            int next = a + b;
            a = b;
            b = next;
        }

        scanner.close();
    }
}