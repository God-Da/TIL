import java.util.Scanner;

public class StarPatterns {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("별의 높이를 입력하세요: ");
        int n = scanner.nextInt();

        System.out.println("\n1. 오른쪽으로 증가하는 별 찍기");
        rightIncreasing(n);

        System.out.println("\n2. 왼쪽으로 증가하는 별 찍기");
        leftIncreasing(n);

        System.out.println("\n3. 피라미드 별 찍기");
        pyramid(n);

        System.out.println("\n4. 역 피라미드 별 찍기");
        reversePyramid(n);

        System.out.println("\n5. 다이아몬드 별 찍기");
        diamond(n);

        scanner.close();
    }

    // 1. 오른쪽으로 증가하는 별 찍기
    public static void rightIncreasing(int n) {
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= i; j++) {
                System.out.print("*");
            }
            System.out.println();
        }
    }

    // 2. 왼쪽으로 증가하는 별 찍기
    public static void leftIncreasing(int n) {
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= n - i; j++) {
                System.out.print(" "); // 공백 출력
            }
            for (int j = 1; j <= i; j++) {
                System.out.print("*"); // 별 출력
            }
            System.out.println();
        }
    }

    // 3. 피라미드 별 찍기
    public static void pyramid(int n) {
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= n - i; j++) {
                System.out.print(" "); // 공백 출력
            }
            for (int j = 1; j <= 2 * i - 1; j++) {
                System.out.print("*"); // 별 출력
            }
            System.out.println();
        }
    }

    // 4. 역 피라미드 별 찍기
    public static void reversePyramid(int n) {
        for (int i = n; i >= 1; i--) {
            for (int j = 1; j <= n - i; j++) {
                System.out.print(" "); // 공백 출력
            }
            for (int j = 1; j <= 2 * i - 1; j++) {
                System.out.print("*"); // 별 출력
            }
            System.out.println();
        }
    }

    // 5. 다이아몬드 별 찍기
    public static void diamond(int n) {
        // 윗부분 (피라미드)
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= n - i; j++) {
                System.out.print(" "); // 공백 출력
            }
            for (int j = 1; j <= 2 * i - 1; j++) {
                System.out.print("*"); // 별 출력
            }
            System.out.println();
        }
        // 아랫부분 (역 피라미드)
        for (int i = n - 1; i >= 1; i--) {
            for (int j = 1; j <= n - i; j++) {
                System.out.print(" "); // 공백 출력
            }
            for (int j = 1; j <= 2 * i - 1; j++) {
                System.out.print("*"); // 별 출력
            }
            System.out.println();
        }
    }
}